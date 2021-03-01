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

  # Há 2 formas de se trabalhar com changeset
  # 1º Changeset de criação: que sempre partirá de uma struct vazia
  # 2º Changeset de update: começa com uam struct já preenchida, e fará o cast somente do que muda.

  # %__MODULE__{}                             # Struct vazia

  # "\\": é o default, caso não seja enviado um struct deverá usar %__MODULE__{}
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)         # Faz cast dos dados e insere dados na struct acima; Converte a Struct para um Ecto.Changeset
    |> validate_required(@required_params)
    |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)             # {nome do campo}, {nome da constraint}
  end

end
