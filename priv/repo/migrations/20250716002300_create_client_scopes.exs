defmodule Cafein.Repo.Migrations.CreateClientScopes do
  use Ecto.Migration

  def change do
    create table(:client_scopes, primary_key: false) do
      add :id, :string, primary_key: true
      add :client_id, :string, null: false
      add :scope_id, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
