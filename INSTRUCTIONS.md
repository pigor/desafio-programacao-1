# Solução

## Pré-requisitos

Para rodar a aplicação é necessário o Redis Server (https://redis.io/), para instalá-lo é só seguir a documentação no site oficial da ferramenta que pode ser acessado pelo link acima.

## Instruções

Para rodar a aplicação siga os passos abaixo:

1 - Realize o clone do projeto
> git clone <url do projeto>

2 - Atualize as dependências do projeto
> bundle install

3 - Configure o banco de dados
> rake db:create
> rake db:migrate

4 - Execute os servidores e serviçoes (Redis, Sidekiq e Puma) para acessar a aplicação
> foreman start -f Procfile.dev

5 - Acesse a aplicação no browser na url
> http://localhost:3000

## Execução dos testes

A aplicação usa o Rspec para a suite de testes, para executar os testes execute o comando abaixo:
> rspec