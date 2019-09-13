# README

This is the URB's process monitoring from PMC.

This system deals with the process management of the Secretariat of Urbanism and Works.

The application starts at /adm log in and enjoy


## Versions
* Ruby: **2.6.3**
* Rails: **6.0.0**

## Deployment
1. bundle install
2. rails db:create db:migrate db:seed
3. Done!

## TODO

- [ ] Search by protocol to check status (with login)
- [ ] Cadastro com login do cidadão, e-mail para recuperação de senha
- [ ] Traduzir enum do status do processo
- [ ] Adicionar código do processo (xxx/ANO => 1212/2019)
- [ ] Mostrar campo de tempo válido (Processo)
- [ ] Dashboard - Listar na ordem de duração (parado a mais tempo (em passos que o tempo não conta)) TOP 10
- [ ] Validação do CPF e CNPJ
- [ ] Próximo passo (Processo) - adicionar o usuário responsável e o **usuário logado**
- [ ] Próximo passo (Processo) == passar a bola para o usuário responsável
- [ ] Passos do Tipo => Cadastrar usuários responsáveis pelos processos neste passo
- [ ] Usuário normal visualizar apenas os processos que estão nos passos de sua responsabilidade
- [ ] Novo Passo do Tipo traduzir o kind
- [ ] Adicionar status de archieved (Processo)
- [ ] Adicionar campo de Serviço/Assunto no cadastro do Processo (Select Field)
- [ ] Imprimir Capa do processo com dados
- [ ] Alterar dados de cadastro do processo de acordo com a ficha

### Dashboard

- [ ] Visual Dashboard
- [ ] Intervalo do ano atual
- [ ] Mediana em DIAS
- [ ] Mediana Total (Por TIPO e total)
- [ ] Mediana Mensal (Por TIPO e total)
- [ ] Média por passo
- [ ] Setor (Passo), média (duração) e os 10 que estão a mais tempo.