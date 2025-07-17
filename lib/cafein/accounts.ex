defmodule Cafein.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias Cafein.Accounts.User

  def change_create_account(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
