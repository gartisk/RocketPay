defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  # Info: para usar usar o render é necessário importar o Phoenix.View
  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  # Info: Não criamos com describe pela simplicidade do teste a ser realizado,
  # repetindo padrao aplicado em ErrorViewTest
  test "renders create.json" do
    params = %{
      name: "Guilherme",
      password: "123456",
      nickname: "gartisk",
      email: "guilherme@email.com",
      age: 32
    }

    {:ok,  %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
            balance: Decimal.new("0.00"),
            id: account_id
          },
          id: user_id,
          name: "Guilherme",
          nickname: "gartisk"
        }
    }

    assert expected_response == response
  end

end
