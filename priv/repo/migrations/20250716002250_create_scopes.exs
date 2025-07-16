defmodule Cafein.Repo.Migrations.CreateScopes do
  use Ecto.Migration

  def change do
    create table(:scopes, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string, null: false
      add :description, :string, null: false
      add :is_public, :boolean, default: true, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:scopes, [:name])
  end
end
