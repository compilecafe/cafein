defmodule Cafein.Consents.UserConsent do
  use Cafein.Schema

  schema "user_consents" do
    field :user_id, :string
    field :client_id, :string
    field :scopes, {:array, :string}
    field :granted_at, :utc_datetime
    field :revoked_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_consent, attrs) do
    user_consent
    |> cast(attrs, [:id, :user_id, :client_id, :scopes, :granted_at, :revoked_at])
    |> validate_required([:id, :user_id, :client_id, :scopes, :granted_at, :revoked_at])
  end
end
