defmodule Rocketpay.User do
  use Ecto.Schema
  import Ecto.Changeset

  # Info:
  # variavel de modulo, como se fosse uma constante.
  # binary_id define que deverá ser criado um UUID(Ecto.UUID.generate)
  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age, :email, :password, :nickname]

  schema "users" do
      field :name, :string
      field :age, :integer
      field :email, :string
      field :password_hash, :string
      field :nickname, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
