defmodule CafeinWeb.UserLive.Index do
  use CafeinWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :github_stars, get_stars())}
  end

  defp get_stars() do
    url = "https://api.github.com/repos/compilecafe/cafein"

    headers = [
      {"User-Agent", "PhoenixApp"},
      {"Authorization", "Bearer " <> System.get_env("GITHUB_TOKEN")}
    ]

    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("stargazers_count")

      _ ->
        nil
    end
  end
end
