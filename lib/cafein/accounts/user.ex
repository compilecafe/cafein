defmodule Cafein.Accounts.User do
  use Cafein.Schema

  schema "users" do
    field :username, :string
    field :password_hash, :string
    field :email, :string
    field :email_verified_at, :utc_datetime
    field :phone, :string
    field :phone_verified_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :id,
      :username,
      :password_hash,
      :email,
      :email_verified_at,
      :phone,
      :phone_verified_at
    ])
    |> validate_required([
      :id,
      :username,
      :password_hash,
      :email,
      :email_verified_at,
      :phone,
      :phone_verified_at
    ])
  end
end
