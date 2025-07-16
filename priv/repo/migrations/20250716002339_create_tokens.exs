defmodule Cafein.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens, primary_key: false) do
      add :id, :string, primary_key: true
      add :token, :string, null: false
      add :type, :string, null: false
      add :user_id, :string, null: false
      add :client_id, :string, null: false
      add :scopes, {:array, :string}, null: false
      add :expires_at, :utc_datetime, null: false
      add :revoked_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:tokens, [:token])
  end
end
