-------------------------------------------------------------------------------
-- Coleção de scripts úteis para adminsitração de banco de dados SQL Server ---
-------------------------------------------------------------------------------

-- Comandos em execução
select text, *
from sys.dm_exec_requests
	 cross apply sys.dm_exec_sql_text(sql_handle)
where session_id != @@SPID;

-- Cancelar comando em execução (CUIDADO !)
-- kill 86;

-- Resetar sequencia do banco de dados
dbcc checkident ('tabela', reseed, 1);

-- Listar conexões ativas
select
    db_name(dbid) as dbname,
    count(dbid) as numberofconnections,
    loginame as loginname
from sys.sysprocesses
where dbid > 0
group by
    dbid, loginame;

-- Espaço ocupado por uma tabela
exec sp_spaceused 'infra.LogIntegracao';    

-- Consultas sem indices
SELECT db.[name] AS [DatabaseName]
    ,id.[object_id] AS [ObjectID]
	,OBJECT_NAME(id.[object_id], db.[database_id]) AS [ObjectName]
    ,id.[statement] AS [FullyQualifiedObjectName]
    ,id.[equality_columns] AS [EqualityColumns]
    ,id.[inequality_columns] AS [InEqualityColumns]
    ,id.[included_columns] AS [IncludedColumns]
    ,gs.[unique_compiles] AS [UniqueCompiles]
    ,gs.[user_seeks] AS [UserSeeks]
    ,gs.[user_scans] AS [UserScans]
    ,gs.[last_user_seek] AS [LastUserSeekTime]
    ,gs.[last_user_scan] AS [LastUserScanTime]
    ,gs.[avg_total_user_cost] AS [AvgTotalUserCost]  -- Average cost of the user queries that could be reduced by the index in the group.
    ,gs.[avg_user_impact] AS [AvgUserImpact]  -- The value means that the query cost would on average drop by this percentage if this missing index group was implemented.
    ,gs.[system_seeks] AS [SystemSeeks]
    ,gs.[system_scans] AS [SystemScans]
    ,gs.[last_system_seek] AS [LastSystemSeekTime]
    ,gs.[last_system_scan] AS [LastSystemScanTime]
    ,gs.[avg_total_system_cost] AS [AvgTotalSystemCost]
    ,gs.[avg_system_impact] AS [AvgSystemImpact]  -- Average percentage benefit that system queries could experience if this missing index group was implemented.
    ,gs.[user_seeks] * gs.[avg_total_user_cost] * (gs.[avg_user_impact] * 0.01) AS [IndexAdvantage]
    ,'CREATE INDEX [IX_' + OBJECT_NAME(id.[object_id], db.[database_id]) + '_' + REPLACE(REPLACE(REPLACE(ISNULL(id.[equality_columns], ''), ', ', '_'), '[', ''), ']', '') + CASE
        WHEN id.[equality_columns] IS NOT NULL
            AND id.[inequality_columns] IS NOT NULL
            THEN '_'
        ELSE ''
        END + REPLACE(REPLACE(REPLACE(ISNULL(id.[inequality_columns], ''), ', ', '_'), '[', ''), ']', '') + '_' + LEFT(CAST(NEWID() AS [nvarchar](64)), 5) + ']' + ' ON ' + id.[statement] + ' (' + ISNULL(id.[equality_columns], '') + CASE
        WHEN id.[equality_columns] IS NOT NULL
            AND id.[inequality_columns] IS NOT NULL
            THEN ','
        ELSE ''
        END + ISNULL(id.[inequality_columns], '') + ')' + ISNULL(' INCLUDE (' + id.[included_columns] + ')', '') AS [ProposedIndex]
    ,CAST(CURRENT_TIMESTAMP AS [smalldatetime]) AS [CollectionDate]
FROM [sys].[dm_db_missing_index_group_stats] gs WITH (NOLOCK)
     JOIN [sys].[dm_db_missing_index_groups] ig WITH (NOLOCK) ON gs.[group_handle] = ig.[index_group_handle]
     JOIN [sys].[dm_db_missing_index_details] id WITH (NOLOCK) ON ig.[index_handle] = id.[index_handle]
     JOIN [sys].[databases] db WITH (NOLOCK) ON db.[database_id] = id.[database_id]
-- where db.[name] = 'workshop02-performance'
WHERE  db.[database_id] = DB_ID()
-- AND OBJECT_NAME(id.[object_id], db.[database_id]) like 'LOTE%'
ORDER BY ObjectName, [IndexAdvantage] DESC
OPTION (RECOMPILE);

-- Consultas sem indices resumido
select top 20
	round(s.avg_total_user_cost * s.avg_user_impact * (s.user_seeks + s.user_scans),0) as [total cost],
    db.name,
    d.[statement] as [table name],
    equality_columns,
    inequality_columns,
    included_columns
from sys.dm_db_missing_index_groups g with (nolock)
	 join sys.dm_db_missing_index_group_stats s with (nolock) on s.group_handle = g.index_group_handle
	 join sys.dm_db_missing_index_details d with (nolock) on d.index_handle = g.index_handle
     join [sys].[databases] db with (nolock) ON db.[database_id] = d.[database_id]
-- where db.[name] = 'workshop02-performance'
order by [total cost] desc;

-- Queries lentas
select top 20
	 creation_time
    ,last_execution_time
    ,last_elapsed_time/1000000 last_elapsed_time_in_seg
    ,total_physical_reads
    ,total_logical_reads
    ,total_logical_writes
    ,execution_count
    ,total_worker_time / 1000000 as total_worker_time_seg
    ,total_elapsed_time / 1000000 as total_elapsed_time_seg
    ,total_elapsed_time / execution_count / 1000000 as avg_elapsed_time_seg
    ,substring(
    	st.text,
        (qs.statement_start_offset/2) + 1,
    	((	case statement_end_offset
          when -1 then datalength(st.text)
          else qs.statement_end_offset
     	end - qs.statement_start_offset) / 2) + 1) as statement_text
from sys.dm_exec_query_stats as qs
cross apply sys.dm_exec_sql_text(qs.sql_handle) st
where st.text like '%Pessoa%'
-- where st.text like '%DocumentoSemIndice2%'
order by total_elapsed_time / execution_count desc;