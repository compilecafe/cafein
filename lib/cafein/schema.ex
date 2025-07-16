defmodule Cafein.Schema do
  defmacro __using__(_opts \\ []) do
    quote do
      use Ecto.Schema

      @primary_key {:id, Cafein.Types.ID, autogenerate: true}
      @foreign_key_type :string

      import Ecto.Changeset
    end
  end
end
