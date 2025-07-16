defmodule Cafein.Utils.Mnemonic do
  @moduledoc false

  @wordlist_path Path.join(:code.priv_dir(:cafein), "text/english_wordlist.txt")

  def generate_phrase do
    wordlist = load_wordlist()

    for _ <- 1..24 do
      Enum.random(wordlist)
    end
  end

  def generate_phrase_string do
    generate_phrase()
    |> Enum.join(" ")
  end

  defp load_wordlist do
    @wordlist_path
    |> File.read!()
    |> String.split("\n", trim: true)
  end
end
