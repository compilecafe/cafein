defmodule Cafein.AuthorizationsTest do
  use Cafein.DataCase

  alias Cafein.Authorizations

  describe "authorization_codes" do
    alias Cafein.Authorizations.AuthorizationCode

    import Cafein.AuthorizationsFixtures

    @invalid_attrs %{
      id: nil,
      user_id: nil,
      client_id: nil,
      scopes: nil,
      redirect_uri: nil,
      code_challenge: nil,
      code_challenge_method: nil,
      expires_at: nil,
      used_at: nil
    }

    test "list_authorization_codes/0 returns all authorization_codes" do
      authorization_code = authorization_code_fixture()
      assert Authorizations.list_authorization_codes() == [authorization_code]
    end

    test "get_authorization_code!/1 returns the authorization_code with given id" do
      authorization_code = authorization_code_fixture()
      assert Authorizations.get_authorization_code!(authorization_code.id) == authorization_code
    end

    test "create_authorization_code/1 with valid data creates a authorization_code" do
      valid_attrs = %{
        id: "some id",
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: ["option1", "option2"],
        redirect_uri: "some redirect_uri",
        code_challenge: "some code_challenge",
        code_challenge_method: "some code_challenge_method",
        expires_at: ~U[2025-07-15 00:23:00Z],
        used_at: ~U[2025-07-15 00:23:00Z]
      }

      assert {:ok, %AuthorizationCode{} = authorization_code} =
               Authorizations.create_authorization_code(valid_attrs)

      assert authorization_code.id == "some id"
      assert authorization_code.user_id == "some user_id"
      assert authorization_code.client_id == "some client_id"
      assert authorization_code.scopes == ["option1", "option2"]
      assert authorization_code.redirect_uri == "some redirect_uri"
      assert authorization_code.code_challenge == "some code_challenge"
      assert authorization_code.code_challenge_method == "some code_challenge_method"
      assert authorization_code.expires_at == ~U[2025-07-15 00:23:00Z]
      assert authorization_code.used_at == ~U[2025-07-15 00:23:00Z]
    end

    test "create_authorization_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               Authorizations.create_authorization_code(@invalid_attrs)
    end

    test "update_authorization_code/2 with valid data updates the authorization_code" do
      authorization_code = authorization_code_fixture()

      update_attrs = %{
        id: "some updated id",
        user_id: "some updated user_id",
        client_id: "some updated client_id",
        scopes: ["option1"],
        redirect_uri: "some updated redirect_uri",
        code_challenge: "some updated code_challenge",
        code_challenge_method: "some updated code_challenge_method",
        expires_at: ~U[2025-07-16 00:23:00Z],
        used_at: ~U[2025-07-16 00:23:00Z]
      }

      assert {:ok, %AuthorizationCode{} = authorization_code} =
               Authorizations.update_authorization_code(authorization_code, update_attrs)

      assert authorization_code.id == "some updated id"
      assert authorization_code.user_id == "some updated user_id"
      assert authorization_code.client_id == "some updated client_id"
      assert authorization_code.scopes == ["option1"]
      assert authorization_code.redirect_uri == "some updated redirect_uri"
      assert authorization_code.code_challenge == "some updated code_challenge"
      assert authorization_code.code_challenge_method == "some updated code_challenge_method"
      assert authorization_code.expires_at == ~U[2025-07-16 00:23:00Z]
      assert authorization_code.used_at == ~U[2025-07-16 00:23:00Z]
    end

    test "update_authorization_code/2 with invalid data returns error changeset" do
      authorization_code = authorization_code_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Authorizations.update_authorization_code(authorization_code, @invalid_attrs)

      assert authorization_code == Authorizations.get_authorization_code!(authorization_code.id)
    end

    test "delete_authorization_code/1 deletes the authorization_code" do
      authorization_code = authorization_code_fixture()

      assert {:ok, %AuthorizationCode{}} =
               Authorizations.delete_authorization_code(authorization_code)

      assert_raise Ecto.NoResultsError, fn ->
        Authorizations.get_authorization_code!(authorization_code.id)
      end
    end

    test "change_authorization_code/1 returns a authorization_code changeset" do
      authorization_code = authorization_code_fixture()
      assert %Ecto.Changeset{} = Authorizations.change_authorization_code(authorization_code)
    end
  end

  describe "tokens" do
    alias Cafein.Authorizations.Token

    import Cafein.AuthorizationsFixtures

    @invalid_attrs %{
      id: nil,
      type: nil,
      token: nil,
      user_id: nil,
      client_id: nil,
      scopes: nil,
      expires_at: nil,
      revoked_at: nil
    }

    test "list_tokens/0 returns all tokens" do
      token = token_fixture()
      assert Authorizations.list_tokens() == [token]
    end

    test "get_token!/1 returns the token with given id" do
      token = token_fixture()
      assert Authorizations.get_token!(token.id) == token
    end

    test "create_token/1 with valid data creates a token" do
      valid_attrs = %{
        id: "some id",
        type: "some type",
        token: "some token",
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: ["option1", "option2"],
        expires_at: ~U[2025-07-15 00:23:00Z],
        revoked_at: ~U[2025-07-15 00:23:00Z]
      }

      assert {:ok, %Token{} = token} = Authorizations.create_token(valid_attrs)
      assert token.id == "some id"
      assert token.type == "some type"
      assert token.token == "some token"
      assert token.user_id == "some user_id"
      assert token.client_id == "some client_id"
      assert token.scopes == ["option1", "option2"]
      assert token.expires_at == ~U[2025-07-15 00:23:00Z]
      assert token.revoked_at == ~U[2025-07-15 00:23:00Z]
    end

    test "create_token/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authorizations.create_token(@invalid_attrs)
    end

    test "update_token/2 with valid data updates the token" do
      token = token_fixture()

      update_attrs = %{
        id: "some updated id",
        type: "some updated type",
        token: "some updated token",
        user_id: "some updated user_id",
        client_id: "some updated client_id",
        scopes: ["option1"],
        expires_at: ~U[2025-07-16 00:23:00Z],
        revoked_at: ~U[2025-07-16 00:23:00Z]
      }

      assert {:ok, %Token{} = token} = Authorizations.update_token(token, update_attrs)
      assert token.id == "some updated id"
      assert token.type == "some updated type"
      assert token.token == "some updated token"
      assert token.user_id == "some updated user_id"
      assert token.client_id == "some updated client_id"
      assert token.scopes == ["option1"]
      assert token.expires_at == ~U[2025-07-16 00:23:00Z]
      assert token.revoked_at == ~U[2025-07-16 00:23:00Z]
    end

    test "update_token/2 with invalid data returns error changeset" do
      token = token_fixture()
      assert {:error, %Ecto.Changeset{}} = Authorizations.update_token(token, @invalid_attrs)
      assert token == Authorizations.get_token!(token.id)
    end

    test "delete_token/1 deletes the token" do
      token = token_fixture()
      assert {:ok, %Token{}} = Authorizations.delete_token(token)
      assert_raise Ecto.NoResultsError, fn -> Authorizations.get_token!(token.id) end
    end

    test "change_token/1 returns a token changeset" do
      token = token_fixture()
      assert %Ecto.Changeset{} = Authorizations.change_token(token)
    end
  end
end
