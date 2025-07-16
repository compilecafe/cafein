defmodule Cafein.AuthorizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafein.Authorizations` context.
  """

  @doc """
  Generate a authorization_code.
  """
  def authorization_code_fixture(attrs \\ %{}) do
    {:ok, authorization_code} =
      attrs
      |> Enum.into(%{
        client_id: "some client_id",
        code_challenge: "some code_challenge",
        code_challenge_method: "some code_challenge_method",
        expires_at: ~U[2025-07-15 00:23:00Z],
        id: "some id",
        redirect_uri: "some redirect_uri",
        scopes: ["option1", "option2"],
        used_at: ~U[2025-07-15 00:23:00Z],
        user_id: "some user_id"
      })
      |> Cafein.Authorizations.create_authorization_code()

    authorization_code
  end

  @doc """
  Generate a token.
  """
  def token_fixture(attrs \\ %{}) do
    {:ok, token} =
      attrs
      |> Enum.into(%{
        client_id: "some client_id",
        expires_at: ~U[2025-07-15 00:23:00Z],
        id: "some id",
        revoked_at: ~U[2025-07-15 00:23:00Z],
        scopes: ["option1", "option2"],
        token: "some token",
        type: "some type",
        user_id: "some user_id"
      })
      |> Cafein.Authorizations.create_token()

    token
  end
end
