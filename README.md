# Awesome

<div align="center">
    <img width="200" height="140" src="resources/icon.png" alt="Awesome">
    <br>
    <br>
    <p>Coisas interessantes e úteis para estudo.</p>
    <p>Material com foco em tecnologia Microsoft .NET</p>
    <br>
</div>

## Bibliotecas úteis .NET

- [Maestria Extensions Methods](https://github.com/orgs/MaestriaNet): Métodos de extensões para incrementar a produtividade em C#.
- [Humanizer](https://github.com/Humanizr/Humanizer): Manipulação de strings, enums, times, timespans, numbers e quantidades para apresentação mais legível ao ser humano.
- [FluentDateTime](https://github.com/FluentDateTime/FluentDateTime): Extensões para operações com data e hora.
- [SmartFormat](https://github.com/axuno/SmartFormat): Incremento para string.format() para suportar formatação com as propriedades de um objeto.
- [MessageFormat](https://github.com/jeffijoe/messageformat.net): Implementação .NET para ["ICU Message Format"](http://userguide.icu-project.org/formatparse/messages).
- [Flurl](https://flurl.dev/): Fluent library para HTTP e URL.
- [Hangfire](https://www.hangfire.io/): Uma maneira fácil de executar o processamento em segundo plano nos aplicativos .NET e .NET Core. Nenhum serviço do Windows ou processo separado é necessário. Aberto e gratuito para uso comercial.
- [Quartz.NET](https://www.quartz-scheduler.net/): Sistema completo de agendamento de tarefas de código aberto que pode ser usado desde os aplicativos mais pequenos até os sistemas corporativos de grande escala. Versão .NET do projeto original [Java](http://www.quartz-scheduler.org/).

---

## Ferramentas / Tools

### Online

- [gitignore.io](https://www.gitignore.io): Crie arquivos .gitignore úteis para o seu projeto.
- [Stack Trace Formatter](https://elmah.io/tools/stack-trace-formatter): Formatar log de erros .NET.
- [DoFactory](https://www.dofactory.com/net/design-patterns): Consulta rápida de padrões de projetos.
- [db-engines](https://db-engines.com/en/ranking): Web site com indice de uso/popularidade dos sistema de armazenamento de dados e modelos de dados suportados.
- [Stackblitz](https://stackblitz.com): Editor de código fonte online.

### Desktop

- [Cmder](https://cmder.net/): Emulator de terminal para windows com suporte a cmd, powershell, bash, ssh, entre outros.
- [Visual Studio Code](https://code.visualstudio.com/): Ferramenta de desenvolvimento open source e versátil da Microsoft.
- [Notepad++](https://notepad-plus-plus.org/downloads/): Ferramenta de edição de arquivos e código fonte open source;
- [IL Spy](https://github.com/icsharpcode/ILSpy): .NET assembly browser and decompiler (IL and C# preview from binary).
- [NSwagStudio](https://github.com/RicoSuter/NSwag/wiki/NSwagStudio): Gerador de cliente HTTP .NET/TypeScript a partir da especificação Swagger da API.

---

## Banco de dados

### SQL Server

- Licenças:
  - [Express](https://www.microsoft.com/pt-br/sql-server/sql-server-editions-express): Gratuita com limitações para uso comercial, verifique o comparativo entre versões para ver se não é prejudicial ao seu ambiente.
  - [Developer](https://www.cloudmotion.com.br/blog/2018/02/09/afinal-o-sql-server-developer-edition-e-de-graca/): Esta versão possui todas as features da versão entreprise, porém destina-se a uso em ambiente de testes e desenvolvimento.  Pode ser obtido gratuitamente, mas sua licença não autoriza o uso em ambiente produtivo. Possui sérias restrições de performance.
  - [Enterpise](https://www.microsoft.com/pt-br/sql-server/sql-server-2017-pricing): Versão completa do sistema para uso comercial.
  - [Comparativo](https://www.microsoft.com/pt-br/sql-server/sql-server-2017-editions).
- Armazenamento multi-modelo:
  - Relacional
  - Documentos
  - Graph
- [Blitz](https://www.brentozar.com/blitz/): Pacote de store procedures para administração de banco de dados.
- [Scripts úteis](Banco%20de%20Dados/SQL%20Server/Util.sql): Coleção de scripts.

### [PostgreSQL](https://www.postgresql.org)

- Licença: Open source e livre para uso comercial.
- Armazenamento multi-modelo:
  - Relacional
  - Documentos JSON
- [PostGIS](https://postgis.net/): Extensão para adicionar suportes a objetos geográficos.
- [pg_prewarm](https://www.postgresql.org/docs/current/pgprewarm.html): Operar base de dados na memória RAM.

### [Redis](https://redis.io/)

- Licença: Open source e livre para uso comercial.
- Estrutura de dados chave/valor em memória RAM;
- Exemplos de uso:
  - Cache de dados persistidos em mecasnismos de armazenamentos lentos (Discos).
  - Message broker.
  - Compartilhamento de dados entre servidores balanceados.

---

## Infra estrutura

- [Docker](https://www.docker.com/): Virtualização de ambiente para aplicações.
- [Chocolatey](https://chocolatey.org/): Gerenciador de pacotes para windows (Semelhante ao apt-get / yum do Linux).
- [HAProxy](http://www.haproxy.org/): Balanceador de carga open source.
- [NGINX](https://www.nginx.com/): Balanceador de carga open source.
- [Kong Gateway](https://konghq.com/kong/): API gateway open source para uso em micro serviços e aplicações distribuidas.
- [Envoy](https://www.envoyproxy.io/): Balanceador de carga, proxy. Serviço executado na borda da infra. Licença open source.

---

## Workflow Engines / CI-CD

- [Wexflow](https://wexflow.github.io/): Orquestrador de fluxo de trabalho multi plataforma para manipular arquivos, executar processos, tarefas agendadas e suporte a tasks personalizadas .NET.
- [AppVeyor](https://www.appveyor.com/): CI/CD multi plataforma focado em Microsoft .NET. Possui instalação free self-hosted além da plataforma in cloud.
- [Jenkis](https://jenkins.io/): CI/CD free de ampla utilização. Instalação self-hosted.
- [Circle CI](https://circleci.com/): CI/CD in cloud. Free apenas para projetos open source.

---

## Private Cloud

- [Next Cloud](https://nextcloud.com/): Núvem privada, com web site, aplicativo multi-plataforma, suporte a deploy no docker, histórico de versões de arquivos, vários plugins oficiais e da comunidade, etc.
- [ownCloud](https://owncloud.org/): Núvem privada.
- [Wiki.JS](https://wiki.js.org/): Wiki privada open source.
- [Book Stack](https://www.bookstackapp.com/): Wiki privada open source.

---

## Web Hosts / VPS / Cloud

- [SSDNodes](https://www.ssdnodes.com/)
- [Hetzner](https://www.hetzner.com/)

## Geração de conteúdo

- [gaGO.io](https://gago.io/): Arquitetura de software e soluções focado em .NET.
- [Edu](https://www.eduardopires.net.br/): Arquitetura empresarial focado em .NET.
- [EximiaCO.tech](https://www.eximiaco.tech/pt/thinking/): Arquitetura de software e soluções, fundamentos de computação, gestão de projetos, mundo corporativo e assuntos cotidianos.
- [OfficialMarinho/Links-uteis](https://github.com/OfficialMarinho/Links-uteis/blob/master/LINKS.md): Repositório com dicas e ferramentas diversas para desenvovledores;

### Podcasts & Canais

- [Lambda3](https://www.lambda3.com.br/lambda3-podcast/): Assuntos técnicos em geral.
- [DevShow](https://devshow.com.br/): Podcast do grupo DotNet Brasil. Principais conteúdos: .NET, Arquitetura, Docker e Micro Serviços.
- [Fábio Akita](https://www.youtube.com/user/AkitaOnRails): Empreendedor e entusiasta tecnológico falando sobre assuntos técnicos e de mercado.

### Artigos interessantes

- [SynchronizationContext and ConfigureAwait](https://devblogs.microsoft.com/dotnet/configureawait-faq/)