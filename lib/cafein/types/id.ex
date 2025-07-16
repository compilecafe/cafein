defmodule Cafein.Types.ID do
  @behaviour Ecto.Type

  def type, do: :string

  def cast(val) when is_binary(val), do: {:ok, val}
  def cast(_), do: :error

  def load(val), do: {:ok, val}
  def dump(val) when is_binary(val), do: {:ok, val}
  def dump(_), do: :error

  def autogenerate, do: Cafein.Utils.ID.generate_id()

  def embed_as(_format), do: :self

  def equal?(term1, term2), do: term1 == term2
end
