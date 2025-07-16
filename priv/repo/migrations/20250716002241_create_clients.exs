defmodule Cafein.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string, null: false
      add :brand, :string
      add :homepage_url, :string
      add :client_id, :string, null: false
      add :client_secret, :string, null: false
      add :callback_url, :string
      add :is_public, :boolean, default: true, null: false
      add :user_id, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:clients, [:client_id])
  end
end
