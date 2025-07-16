defmodule Cafein.OAuthClients.Client do
  use Cafein.Schema

  schema "clients" do
    field :name, :string
    field :client_id, :string
    field :client_secret, :binary
    field :callback_url, :string
    field :is_public, :boolean, default: false
    field :user_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:id, :name, :client_id, :client_secret, :callback_url, :is_public, :user_id])
    |> validate_required([
      :id,
      :name,
      :client_id,
      :client_secret,
      :callback_url,
      :is_public,
      :user_id
    ])
  end
end
