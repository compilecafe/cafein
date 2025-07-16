defmodule Cafein.Authorizations.Token do
  use Cafein.Schema

  schema "tokens" do
    field :type, :string
    field :token, :string
    field :user_id, :string
    field :client_id, :string
    field :scopes, {:array, :string}
    field :expires_at, :utc_datetime
    field :revoked_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:id, :token, :type, :user_id, :client_id, :scopes, :expires_at, :revoked_at])
    |> validate_required([
      :id,
      :token,
      :type,
      :user_id,
      :client_id,
      :scopes,
      :expires_at,
      :revoked_at
    ])
  end
end
