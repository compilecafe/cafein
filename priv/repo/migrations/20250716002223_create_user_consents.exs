defmodule Cafein.Repo.Migrations.CreateUserConsents do
  use Ecto.Migration

  def change do
    create table(:user_consents, primary_key: false) do
      add :id, :string, primary_key: true
      add :user_id, :string, null: false
      add :client_id, :string, null: false
      add :scopes, {:array, :string}, null: false
      add :granted_at, :utc_datetime, null: false
      add :revoked_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
