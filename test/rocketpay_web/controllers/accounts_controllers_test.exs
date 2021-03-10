defmodule RocketpayWeb.AccountsControllerTest do
  # Info: async: true: Habilitação de testes em paralelo
  # Atenção: para alguns casos que possuem acesso concorrente a algum dado.
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Guilherme",
        password: "123456",
        nickname: "gartisk",
        email: "guilherme@email.com",
        age: 32
      }

      {:ok, %User{account: %Account{ id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      # Info: teste de controller sempre precisa passar a conexão a frente
      {:ok, conn: conn, account_id: account_id}
    end

    test "when all the params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))  # Routes de ConnCase
        |> json_response(:ok)                                              # Converte a resposta para json

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Ballance changed successfully"} = response
    end

    test "when there area invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))  # Routes de ConnCase
        |> json_response(:bad_request)                                              # Converte a resposta para json

      # Info: O instrutor no caso esclarece que utilizar o expected_response dessa forma, quando precisa
      # realizar comparação com uso de ==.
      # caso fosse um match não seria necessário o uso da variavel expected_response.
      expected_response = %{"message" => "Invalid deposit value!"}
      assert response == expected_response
    end
  end
end
