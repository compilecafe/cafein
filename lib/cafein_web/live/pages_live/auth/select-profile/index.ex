defmodule CafeinWeb.PagesLive.Auth.SelectProfile.Index do
  use CafeinWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, layout: false}
  end
end
