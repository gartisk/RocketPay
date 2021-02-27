defmodule Rocketpay.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rocketpay.Account

  # Info:
  # variavel de modulo, como se fosse uma constante.
  # binary_id define que deverá ser criado um UUID(Ecto.UUID.generate)
  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age, :email, :password, :nickname]

  schema "users" do
      field :name, :string
      field :age, :integer
      field :email, :string
      field :password, :string, virtual: true
      field :password_hash, :string
      field :nickname, :string
      has_one :account, Account

      timestamps()
  end

  # Info: Objetivo Changeset
  # 1º Mapear Dados
  # 2º Validar Dados
  def changeset(params) do
    %__MODULE__{}                             # Struct vazia
    |> cast(params, @required_params)         # Faz cast dos dados e insere dados na struct acima; Converte a Struct para um Ecto.Changeset
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
    |> put_password_hash()
  end

  # caso não houvesse o alias para o Ecto, seria necessário usar Ecto.Changeset
  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    #Info: função change espera um changeset e um mapa com parametros e retorna o mesmo no changeset
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
