defmodule Cafein.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :username, :string, null: false
      add :password_hash, :string, null: false
      add :email, :string
      add :email_verified_at, :utc_datetime
      add :phone, :string
      add :phone_verified_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
    create unique_index(:users, [:phone])
  end
end
