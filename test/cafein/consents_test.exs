defmodule Cafein.ConsentsTest do
  use Cafein.DataCase

  alias Cafein.Consents

  describe "user_consents" do
    alias Cafein.Consents.UserConsent

    import Cafein.ConsentsFixtures

    @invalid_attrs %{
      id: nil,
      user_id: nil,
      client_id: nil,
      scopes: nil,
      granted_at: nil,
      revoked_at: nil
    }

    test "list_user_consents/0 returns all user_consents" do
      user_consent = user_consent_fixture()
      assert Consents.list_user_consents() == [user_consent]
    end

    test "get_user_consent!/1 returns the user_consent with given id" do
      user_consent = user_consent_fixture()
      assert Consents.get_user_consent!(user_consent.id) == user_consent
    end

    test "create_user_consent/1 with valid data creates a user_consent" do
      valid_attrs = %{
        id: "some id",
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: ["option1", "option2"],
        granted_at: ~U[2025-07-15 00:22:00Z],
        revoked_at: ~U[2025-07-15 00:22:00Z]
      }

      assert {:ok, %UserConsent{} = user_consent} = Consents.create_user_consent(valid_attrs)
      assert user_consent.id == "some id"
      assert user_consent.user_id == "some user_id"
      assert user_consent.client_id == "some client_id"
      assert user_consent.scopes == ["option1", "option2"]
      assert user_consent.granted_at == ~U[2025-07-15 00:22:00Z]
      assert user_consent.revoked_at == ~U[2025-07-15 00:22:00Z]
    end

    test "create_user_consent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Consents.create_user_consent(@invalid_attrs)
    end

    test "update_user_consent/2 with valid data updates the user_consent" do
      user_consent = user_consent_fixture()

      update_attrs = %{
        id: "some updated id",
        user_id: "some updated user_id",
        client_id: "some updated client_id",
        scopes: ["option1"],
        granted_at: ~U[2025-07-16 00:22:00Z],
        revoked_at: ~U[2025-07-16 00:22:00Z]
      }

      assert {:ok, %UserConsent{} = user_consent} =
               Consents.update_user_consent(user_consent, update_attrs)

      assert user_consent.id == "some updated id"
      assert user_consent.user_id == "some updated user_id"
      assert user_consent.client_id == "some updated client_id"
      assert user_consent.scopes == ["option1"]
      assert user_consent.granted_at == ~U[2025-07-16 00:22:00Z]
      assert user_consent.revoked_at == ~U[2025-07-16 00:22:00Z]
    end

    test "update_user_consent/2 with invalid data returns error changeset" do
      user_consent = user_consent_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Consents.update_user_consent(user_consent, @invalid_attrs)

      assert user_consent == Consents.get_user_consent!(user_consent.id)
    end

    test "delete_user_consent/1 deletes the user_consent" do
      user_consent = user_consent_fixture()
      assert {:ok, %UserConsent{}} = Consents.delete_user_consent(user_consent)
      assert_raise Ecto.NoResultsError, fn -> Consents.get_user_consent!(user_consent.id) end
    end

    test "change_user_consent/1 returns a user_consent changeset" do
      user_consent = user_consent_fixture()
      assert %Ecto.Changeset{} = Consents.change_user_consent(user_consent)
    end
  end
end
