defmodule Cafein.Utils.ID do
  @moduledoc false

  @machine_id System.get_env("CAFEIN_NODE_ID") || "M1"

  def generate_id do
    timestamp = timestamp_now()
    random = random_base62(6)
    "CAF#{timestamp}#{@machine_id}#{random}"
  end

  def generate_client_id do
    timestamp = timestamp_now_short()
    random = random_base62(8)
    base_id = "CAFCL#{timestamp}#{@machine_id}#{random}"
    phrase = random_phrase()
    "#{base_id}_#{phrase}"
  end

  def generate_client_secret do
    random = secure_random_base64(32)
    "CAFSC_#{random}"
  end

  defp timestamp_now do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.to_string()
    |> String.replace(~r/[-:\s]/, "")
    |> String.slice(0, 14)
  end

  defp timestamp_now_short do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.to_string()
    |> String.replace(~r/[-:\s]/, "")
    |> String.slice(2, 12)
  end

  defp random_base62(length) do
    charset = ~c'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    for _ <- 1..length, into: "", do: <<Enum.random(charset)>>
  end

  defp secure_random_base64(length) do
    length
    |> :crypto.strong_rand_bytes()
    |> Base.encode64(padding: false)
    |> binary_part(0, length)
    |> String.upcase()
  end

  defp random_phrase do
    phrase_path = Path.join(:code.priv_dir(:cafein), "text/client_id_phrases.txt")

    phrase_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.reject(&(&1 == ""))
    |> Enum.random()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s]/, "")
    |> String.replace(~r/\s+/, "_")
  end
end
