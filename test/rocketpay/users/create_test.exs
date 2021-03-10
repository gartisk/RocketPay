defmodule Rocketpay.Users.CreateTest do
  # Info: Datacase configura o banco para teste e permite usar o errors_on
  # A função de usar banco em modo teste é boa pois, ao final da bateria os dados no banco voltam ao estado inicial.
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Guilherme",
        password: "123456",
        nickname: "gartisk",
        email: "guilherme@email.com",
        age: 32
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      # Info: "^" pin operator: como usamos pattern match, não devemos usar valores dessa forma "...id: user_id..."
      # estariamos assim atribuindo o resultado a user_id e não checando se o valor da chave é oque está em user_id.
      # para situações como essa utilizamos o pin operador.
      assert %User{
        name: "Guilherme",
        age: 32,
        id: ^user_id
      } = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Guilherme",
        nickname: "gartisk",
        email: "guilherme@email.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
