defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  # Info:
  # A função change é utilizada tanto para migração quanto para rollback
  # É possível vermos o uso com "def up" e "def down" sendo respectivamente um para migration e outro para rollback
  def change do
    create table :users do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
