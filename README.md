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
mix ecto.migration
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

#### Para inserir o usuário no banco
```
%{name: "Guilherme", password: "guilherme@email.com", email: "guilherme@email.com", nickname: "guilherme", age: 32}
|> Rocketpay.User.changeset()
|> Rocketpay.Repo.insert
```

#### Outros

Testes de Bcrypt

```
Bcrypt.add_hash("123456")
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
