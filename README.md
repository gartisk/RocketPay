# Rocketpay
Exercicios da #NWL4 da Rocketseat.

Recursos:
- Criação de usuário
- Criação de conta
- Depósito de saldo
- Saque de saldo
- Transfência de valores entre contas.

Tecnologias:
- Aplicação Elixir + Phoenix + Ecto.
- Outras libs: credo, bcrypt_elixir, decimal e excoveralls.

Para encontrar anotações úteis no código busque pela palavra "Info" no projeto.

## Comandos Mix Úteis

```sh
# Para baixar dependencias do projeto
mix deps.get

# Criar Banco
mix ecto.create

# Remover Banco
mix ecto.drop

# Executar Migrations
mix ecto.migrate

# Visualizar Migrations
mix ecto.migrations

# Criar Nova Migration
mix ecto.gen.migration create_user_table

# Para saber percentual de cobetura de testes
mix test --cover
```

## Comandos IEX Úteis

```elixir
# Criar novo usuário
Rocketpay.User.changeset(%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}) 

# Buscar todos os usuários
Rocketpay.Repo.all(Rocketpay.User)

# Buscar todos usuários e suas respectivas contas
Rocketpay.Repo.all(Rocketpay.User) |> Rocketpay.Repo.preload(:account)

# Depositar na conta do usuário
# - Lembrar que este "id" é da Account
Rocketpay.deposit(%{"id" => "e435373d-f1e6-48f7-9ca4-47d1cb436867", "value" => "50.0"})

# Inserir o usuário
%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.User.changeset()
|> Rocketpay.Repo.insert()

# inserir usuário e conta
%{name: "Guilherme2", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.create_user()

# Transferencia entre contas
Rocketpay.Accounts.Transaction.call(%{ "from" => "e435373d-f1e6-48f7-9ca4-47d1cb436867", "to" => "f05016e9-06cf-4a4a-84d6-c04b5475e04f", "value" => "1"})

# Adicionar saldo conta manualmente
%{user_id: "762950f3-ea57-41a6-9a02-fa82535bee71", balance: "50.00"}
|> Rocketpay.Account.changeset()
|> Rocketpay.Repo.insert()
```

## Comandos da API

#### Criar Usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"name": "Guilherme3", "password": "123456", "email": "guilherme3@email.com", "nickname": "guilherme3", "age": 32}' \
http://localhost:4000/api/users \
-u "banana:nanica123"
```

#### Adicionar saldo na conta
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "50"}' \
http://localhost:4000/api/accounts/e435373d-f1e6-48f7-9ca4-47d1cb436867/deposit \
-u "banana:nanica123"
```

#### Sacar valor da conta do usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "50"}' \
http://localhost:4000/api/accounts/e435373d-f1e6-48f7-9ca4-47d1cb436867/withdraw \
-u "banana:nanica123"
```

#### Transferir valores entre contas
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "3.33", "from": "e435373d-f1e6-48f7-9ca4-47d1cb436867", "to": "f05016e9-06cf-4a4a-84d6-c04b5475e04f"}' \
http://localhost:4000/api/accounts/transaction \
-u "banana:nanica123"
```

## Outros

```elixir
# Testes de Bcrypt
Bcrypt.add_hash("123456")

# Para ver documentação de uma função no console utilize `h`:
h Rocketpay.Repo.all
```

--------------------------------
### Padrão

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
