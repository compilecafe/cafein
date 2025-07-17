defmodule Cafein.Accounts.User do
  use Cafein.Schema

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
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
      :username,
      :password,
      :email,
      :email_verified_at,
      :phone,
      :phone_verified_at
    ])
    |> validate_required([
      :username,
      :password
    ])
    |> validate_format(:username, ~r/^[a-zA-Z0-9._]+$/,
      message: "can only contain letters, numbers, dots, and underscores"
    )
    |> validate_length(:username, max: 30, message: "must be at most 30 characters long")
    |> unsafe_validate_unique(:username, Cafein.Repo)
    |> unique_constraint(:username, message: "has already been taken")
    |> validate_length(:password, min: 8, message: "must be at least 8 characters long")
    |> validate_format(:password, ~r/(?=.*[a-z])/,
      message: "must include at least one lowercase letter"
    )
    |> validate_format(:password, ~r/(?=.*[A-Z])/,
      message: "must include at least one uppercase letter"
    )
    |> validate_format(:password, ~r/(?=.*\d)/, message: "must include at least one number")
    |> validate_format(:password, ~r/(?=.*[^A-Za-z0-9])/,
      message: "must include at least one special character"
    )
    |> hash_password()
  end

  defp hash_password(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      password -> put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
    end
  end
end
