defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    # Info: "with" também é um pattern match, se caso funcionar executará o corpo da função.
    # Se o pattern match não funcionar o with retornará o erro para quem o chamou, nesse caso para o phoenix
    # como há um fallback controller criado, este receberá o erro e irar lidar com o mesmo.
    # O instrutor não gosta de usar with em modulos de lógica
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)   # Info: Controller é experto suficiente para buscar a view com mesmo prefixo deste controller.
    end
  end

end
