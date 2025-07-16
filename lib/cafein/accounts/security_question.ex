defmodule Cafein.Accounts.SecurityQuestion do
  use Cafein.Schema

  schema "security_questions" do
    field :question, :string
    field :deprecated_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(security_question, attrs) do
    security_question
    |> cast(attrs, [:id, :question, :deprecated_at])
    |> validate_required([:id, :question, :deprecated_at])
  end
end
