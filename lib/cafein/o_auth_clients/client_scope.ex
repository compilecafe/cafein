defmodule Cafein.OAuthClients.ClientScope do
  use Cafein.Schema

  schema "client_scopes" do
    field :scope_id, :string
    field :client_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client_scope, attrs) do
    client_scope
    |> cast(attrs, [:id, :client_id, :scope_id])
    |> validate_required([:id, :client_id, :scope_id])
  end
end
