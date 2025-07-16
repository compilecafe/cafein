defmodule Cafein.Accounts.RecoveryPhrase do
  use Cafein.Schema

  schema "recovery_phrases" do
    field :user_id, :string
    field :phrases, :string
    field :used_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recovery_phrase, attrs) do
    recovery_phrase
    |> cast(attrs, [:id, :user_id, :phrases, :used_at])
    |> validate_required([:id, :user_id, :phrases, :used_at])
  end
end
