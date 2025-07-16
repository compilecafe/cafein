defmodule Cafein.Repo.Migrations.CreateAuthorizationCodes do
  use Ecto.Migration

  def change do
    create table(:authorization_codes, primary_key: false) do
      add :id, :string, primary_key: true
      add :code, :string, null: false
      add :user_id, :string, null: false
      add :client_id, :string, null: false
      add :scopes, {:array, :string}, null: false
      add :redirect_uri, :string, null: false
      add :code_challenge, :string, null: false
      add :code_challenge_method, :string, null: false
      add :expires_at, :utc_datetime, null: false
      add :used_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:authorization_codes, [:code])
  end
end
