defmodule Cafein.ConsentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafein.Consents` context.
  """

  @doc """
  Generate a user_consent.
  """
  def user_consent_fixture(attrs \\ %{}) do
    {:ok, user_consent} =
      attrs
      |> Enum.into(%{
        client_id: "some client_id",
        granted_at: ~U[2025-07-15 00:22:00Z],
        id: "some id",
        revoked_at: ~U[2025-07-15 00:22:00Z],
        scopes: ["option1", "option2"],
        user_id: "some user_id"
      })
      |> Cafein.Consents.create_user_consent()

    user_consent
  end
end
