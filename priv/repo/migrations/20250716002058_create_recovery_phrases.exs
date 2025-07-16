defmodule Cafein.Repo.Migrations.CreateRecoveryPhrases do
  use Ecto.Migration

  def change do
    create table(:recovery_phrases, primary_key: false) do
      add :id, :string, primary_key: true
      add :user_id, :string, null: false
      add :phrases, {:array, :string}, null: false
      add :used_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
