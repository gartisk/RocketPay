# Rocketpay

Para encontrar dicas busque por "Info"

### Para baixar dependencias do projeto
```sh
mix deps.get
```

### Criação de Banco
```sh
mix ecto.create
```

### Remove Banco
```sh
mix ecto.drop
```

### Rodar Migrations
```sh
mix ecto.migrate
```

### Par visualizar Migrations
```sh
mix ecto.migrations
```

### Criação de Migration
```sh
mix ecto.gen.migration create_user_table
```

### COMANDOS TESTE NO CONSOLE

#### Criação de novo usuário
```elixir
Rocketpay.User.changeset(%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}) 
```

#### Buscar todos os usuários
```elixir
Rocketpay.Repo.all(Rocketpay.User)
```

#### Buscar todos usuários e suas respectivas contas
```elixir
Rocketpay.Repo.all(Rocketpay.User) |> Rocketpay.Repo.preload(:account)
```

#### Depositar na conta do usuário
Lembrar que este "id" é da Account
```elixir
Rocketpay.deposit(%{"id" => "e435373d-f1e6-48f7-9ca4-47d1cb436867", "value" => "50.0"})
```

#### Para inserir o usuário
```elixir
%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.User.changeset()
|> Rocketpay.Repo.insert()
```

#### Para inserir usuário e conta
```elixir
%{name: "Guilherme2", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.create_user()
```

#### Transferencia entre contas
```elixir
Rocketpay.Accounts.Transaction.call(%{ "from" => "e435373d-f1e6-48f7-9ca4-47d1cb436867", "to" => "f05016e9-06cf-4a4a-84d6-c04b5475e04f", "value" => "1"})
```

### Teste de API
Criação de usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"name": "Guilherme3", "password": "123456", "email": "guilherme3@email.com", "nickname": "guilherme3", "age": 32}' \
http://localhost:4000/api/users \
-u "banana:nanica123"
```

Adicionar valores na conta do usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "50"}' \
http://localhost:4000/api/accounts/e435373d-f1e6-48f7-9ca4-47d1cb436867/deposit \
-u "banana:nanica123"
```

Sacar valores da conta do usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "50"}' \
http://localhost:4000/api/accounts/e435373d-f1e6-48f7-9ca4-47d1cb436867/withdraw \
-u "banana:nanica123"
```

Transferir valores entre contas
Sacar valores da conta do usuário
```sh
curl --header "Content-Type: application/json" \
--request POST \
--data '{"value": "3.33", "from": "e435373d-f1e6-48f7-9ca4-47d1cb436867", "to": "f05016e9-06cf-4a4a-84d6-c04b5475e04f"}' \
http://localhost:4000/api/accounts/transaction \
-u "banana:nanica123"
```

### Cobertura de testes

Para saber percentual de cobetura de testes:
```sh
mix test --cover
```
 
#### Outros

Testes de Bcrypt

```elixir
Bcrypt.add_hash("123456")
```

Para ver documentação de uma função no console utilize `h`:
```elixir
h Rocketpay.Repo.all
```

Adicionar saldo conta manualmente:
```elixir
%{user_id: "762950f3-ea57-41a6-9a02-fa82535bee71", balance: "0.00"} |> Rocketpay.Account.changeset() |> Rocketpay.Repo.insert()
```

--------------------------------

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
