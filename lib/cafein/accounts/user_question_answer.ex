defmodule Cafein.Accounts.UserQuestionAnswer do
  use Cafein.Schema

  schema "user_question_answers" do
    field :user_id, :string
    field :question_id, :string
    field :answer_hash, :string
    field :answered_at, :utc_datetime
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_question_answer, attrs) do
    user_question_answer
    |> cast(attrs, [:id, :user_id, :question_id, :answer_hash, :answered_at, :deleted_at])
    |> validate_required([:id, :user_id, :question_id, :answer_hash, :answered_at, :deleted_at])
  end
end
