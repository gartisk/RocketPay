# Rocketpay

Para encontrar dicas busque por "Info"

### Para baixar dependencias do projeto
```
mix deps.get
```

### Criação de Banco
```
mix ecto.create
```

### Remove Banco
```
mix ecto.drop
```

### Rodar Migrations
```
mix ecto.migrate
```

### Par visualizar Migrations
```
mix ecto.migrations
```

### Criação de Migration
```
mix ecto.gen.migration create_user_table
```

### COMANDOS TESTE NO CONSOLE

#### Criação de novo usuário
```
Rocketpay.User.changeset(%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}) 
```

#### Buscar todos os usuários
```
Rocketpay.Repo.all(Rocketpay.User)
```

#### Buscar todos usuários e suas respectivas contas
```
Rocketpay.Repo.all(Rocketpay.User) |> Rocketpay.Repo.preload(:account)
```

#### Depositar na conta do usuário
Lembrar que este "id" é da Account
```
Rocketpay.deposit(%{"id" => "e435373d-f1e6-48f7-9ca4-47d1cb436867", "value" => "50.0"})
```

#### Para inserir o usuário
```
%{name: "Guilherme", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.User.changeset()
|> Rocketpay.Repo.insert()
```

#### Para inserir usuário e conta
```
%{name: "Guilherme2", password: "123456", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.create_user()
```

### Teste de API

```
curl --header "Content-Type: application/json" \
--request POST \
--data '{"name": "Guilherme3", "password": "123456", "email": "guilherme3@email.com", "nickname": "guilherme3", "age": 32}' \
http://localhost:4000/api/users
```

#### Outros

Testes de Bcrypt

```
Bcrypt.add_hash("123456")
```

Para ver documentação de uma função no console utilize `h`:
```
h Rocketpay.Repo.all
```

Inserir saldo conta manualmente:
```
%{user_id: "762950f3-ea57-41a6-9a02-fa82535bee71", balance: "0.00"} |> Rocketpay.Account.changeset() |> Rocketpay.Repo.insert()
```

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
