# README

Este é o sistema de monitoramento de processos da Secretaria de Urbanismo e Obras de Caruaru.

Este sistema lida com a abertura, andamento e finalização dos diversos processos de responsabilidade da secretaria.

Essa aplicação roda somente a partir de `/adm` sob acesso de usuário `admurb2rails@caruaru.pe.gov.br` e senha `123456`.

## Install

Para rodar localmente você deve seguit os passos de Deployment (logo abaixo). Para montar o servidor você pode seguir os passos [deste tutorial](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/), no item 6 (Install Ruby) você pode ter alguma dificuldade com a instalação do RVM, mas ela não é essencial para o funcionamento do sistema, pode ser pulada (Mas lembre-se da versão do Ruby usada aqui).

Além disto utilizaremos o ImageMagick para gerar o PDF do alvará e outros, guia de instalação [aqui](http://www.imagemagick.org/script/download.php)

Após montar o servidor você ainda vai precisar seguir os passos de Deployment.

Usaremos aqui o banco de dados PostgreSQL.


## Versions
* Ruby: **2.6.3**
* Rails: **6.0.0**
* PostgreSQL: **11.4**
* ImageMagick: **7.0.9**

## Deployment
1. `bundle install`
2. `rails db:create db:migrate db:seed`

## TODO

- [ ] Search by protocol to check status (with login)
- [ ] Cadastro com login do cidadão, e-mail para recuperação de senha
- [ ] Traduzir enum do status do processo
- [X] Adicionar código do processo (xxx/ANO => 1212/2019)
- [ ] Mostrar campo de tempo válido (Processo)
- [ ] Dashboard - Listar na ordem de duração (parado a mais tempo (em passos que o tempo não conta)) TOP 10
- [X] Validação do CPF e CNPJ
- [X] Próximo passo (Processo) - adicionar o usuário responsável e o **usuário logado**
- [X] Próximo passo (Processo) == passar a bola para o usuário responsável
- [X] Passos do Tipo => Cadastrar usuários responsáveis pelos processos neste passo
- [X] Usuário normal visualizar apenas os processos que estão nos passos de sua responsabilidade
- [ ] Novo Passo do Tipo traduzir o kind
- [X] Adicionar status de archieved (Processo)
- [ ] Adicionar campo de Serviço/Assunto no cadastro do Processo (Select Field)
- [ ] Imprimir Capa do processo com dados
- [X] Alterar dados de cadastro do processo de acordo com a ficha
- [ ] Gerar PDF do Alvará

### Dashboard

- [ ] Visual Dashboard
- [ ] Intervalo do ano atual
- [ ] Mediana em DIAS
- [ ] Mediana Total (Por TIPO e total)
- [ ] Mediana Mensal (Por TIPO e total)
- [ ] Média por passo
- [ ] Setor (Passo), média (duração) e os 10 que estão a mais tempo.