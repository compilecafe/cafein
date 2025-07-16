defmodule Cafein.Repo.Migrations.CreateSecurityQuestions do
  use Ecto.Migration

  def change do
    create table(:security_questions, primary_key: false) do
      add :id, :string, primary_key: true
      add :question, :string, null: false
      add :deprecated_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
