defmodule Cafein.Authorizations.AuthorizationCode do
  use Cafein.Schema

  schema "authorization_codes" do
    field :user_id, :string
    field :client_id, :string
    field :scopes, {:array, :string}
    field :redirect_uri, :string
    field :code_challenge, :string
    field :code_challenge_method, :string
    field :expires_at, :utc_datetime
    field :used_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(authorization_code, attrs) do
    authorization_code
    |> cast(attrs, [
      :id,
      :user_id,
      :client_id,
      :scopes,
      :redirect_uri,
      :code_challenge,
      :code_challenge_method,
      :expires_at,
      :used_at
    ])
    |> validate_required([
      :id,
      :user_id,
      :client_id,
      :scopes,
      :redirect_uri,
      :code_challenge,
      :code_challenge_method,
      :expires_at,
      :used_at
    ])
  end
end
