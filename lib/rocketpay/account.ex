defmodule Rocketpay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rocketpay.User

  # Info:
  # variavel de modulo, como se fosse uma constante.
  # binary_id define que deverá ser criado um UUID(Ecto.UUID.generate)
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
      field :balance, :decimal
      belongs_to :user, User

      timestamps()
  end

  # Info: Objetivo Changeset
  # 1º Mapear Dados
  # 2º Validar Dados
  def changeset(params) do
    %__MODULE__{}                             # Struct vazia
    |> cast(params, @required_params)         # Faz cast dos dados e insere dados na struct acima; Converte a Struct para um Ecto.Changeset
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)             # {nome do campo}, {nome da constraint}
  end

end
