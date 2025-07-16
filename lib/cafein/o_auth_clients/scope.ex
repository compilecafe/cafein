defmodule Cafein.OAuthClients.Scope do
  use Cafein.Schema

  schema "scopes" do
    field :name, :string
    field :description, :string
    field :is_public, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(scope, attrs) do
    scope
    |> cast(attrs, [:id, :name, :description, :is_public])
    |> validate_required([:id, :name, :description, :is_public])
  end
end
