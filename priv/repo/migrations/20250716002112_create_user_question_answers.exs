defmodule Cafein.Repo.Migrations.CreateUserQuestionAnswers do
  use Ecto.Migration

  def change do
    create table(:user_question_answers, primary_key: false) do
      add :id, :string, primary_key: true
      add :user_id, :string, null: false
      add :question_id, :string, null: false
      add :answer_hash, :string, null: false
      add :answered_at, :utc_datetime, null: false
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
