defmodule Cafein.OAuthClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafein.OAuthClients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        callback_url: "some callback_url",
        client_id: "some client_id",
        client_secret: "some client_secret",
        id: "some id",
        is_public: true,
        name: "some name",
        user_id: "some user_id"
      })
      |> Cafein.OAuthClients.create_client()

    client
  end

  @doc """
  Generate a scope.
  """
  def scope_fixture(attrs \\ %{}) do
    {:ok, scope} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: "some id",
        is_public: true,
        name: "some name"
      })
      |> Cafein.OAuthClients.create_scope()

    scope
  end

  @doc """
  Generate a client_scope.
  """
  def client_scope_fixture(attrs \\ %{}) do
    {:ok, client_scope} =
      attrs
      |> Enum.into(%{
        client_id: "some client_id",
        id: "some id",
        scope_id: "some scope_id"
      })
      |> Cafein.OAuthClients.create_client_scope()

    client_scope
  end
end
