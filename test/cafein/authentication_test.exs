defmodule Cafein.AuthenticationTest do
  use Cafein.DataCase

  alias Cafein.Authentication

  describe "authorization_codes" do
    alias Cafein.Authentication.AuthorizationCode

    import Cafein.AuthenticationFixtures

    @invalid_attrs %{
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
      assert Authentication.list_authorization_codes() == [authorization_code]
    end

    test "get_authorization_code!/1 returns the authorization_code with given id" do
      authorization_code = authorization_code_fixture()
      assert Authentication.get_authorization_code!(authorization_code.id) == authorization_code
    end

    test "create_authorization_code/1 with valid data creates a authorization_code" do
      valid_attrs = %{
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: "some scopes",
        redirect_uri: "some redirect_uri",
        code_challenge: "some code_challenge",
        code_challenge_method: "some code_challenge_method",
        expires_at: ~U[2025-07-14 11:41:00Z],
        used_at: ~U[2025-07-14 11:41:00Z]
      }

      assert {:ok, %AuthorizationCode{} = authorization_code} =
               Authentication.create_authorization_code(valid_attrs)

      assert authorization_code.user_id == "some user_id"
      assert authorization_code.client_id == "some client_id"
      assert authorization_code.scopes == "some scopes"
      assert authorization_code.redirect_uri == "some redirect_uri"
      assert authorization_code.code_challenge == "some code_challenge"
      assert authorization_code.code_challenge_method == "some code_challenge_method"
      assert authorization_code.expires_at == ~U[2025-07-14 11:41:00Z]
      assert authorization_code.used_at == ~U[2025-07-14 11:41:00Z]
    end

    test "create_authorization_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               Authentication.create_authorization_code(@invalid_attrs)
    end

    test "update_authorization_code/2 with valid data updates the authorization_code" do
      authorization_code = authorization_code_fixture()

      update_attrs = %{
        user_id: "some updated user_id",
        client_id: "some updated client_id",
        scopes: "some updated scopes",
        redirect_uri: "some updated redirect_uri",
        code_challenge: "some updated code_challenge",
        code_challenge_method: "some updated code_challenge_method",
        expires_at: ~U[2025-07-15 11:41:00Z],
        used_at: ~U[2025-07-15 11:41:00Z]
      }

      assert {:ok, %AuthorizationCode{} = authorization_code} =
               Authentication.update_authorization_code(authorization_code, update_attrs)

      assert authorization_code.user_id == "some updated user_id"
      assert authorization_code.client_id == "some updated client_id"
      assert authorization_code.scopes == "some updated scopes"
      assert authorization_code.redirect_uri == "some updated redirect_uri"
      assert authorization_code.code_challenge == "some updated code_challenge"
      assert authorization_code.code_challenge_method == "some updated code_challenge_method"
      assert authorization_code.expires_at == ~U[2025-07-15 11:41:00Z]
      assert authorization_code.used_at == ~U[2025-07-15 11:41:00Z]
    end

    test "update_authorization_code/2 with invalid data returns error changeset" do
      authorization_code = authorization_code_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Authentication.update_authorization_code(authorization_code, @invalid_attrs)

      assert authorization_code == Authentication.get_authorization_code!(authorization_code.id)
    end

    test "delete_authorization_code/1 deletes the authorization_code" do
      authorization_code = authorization_code_fixture()

      assert {:ok, %AuthorizationCode{}} =
               Authentication.delete_authorization_code(authorization_code)

      assert_raise Ecto.NoResultsError, fn ->
        Authentication.get_authorization_code!(authorization_code.id)
      end
    end

    test "change_authorization_code/1 returns a authorization_code changeset" do
      authorization_code = authorization_code_fixture()
      assert %Ecto.Changeset{} = Authentication.change_authorization_code(authorization_code)
    end
  end

  describe "tokens" do
    alias Cafein.Authentication.Token

    import Cafein.AuthenticationFixtures

    @invalid_attrs %{
      id: nil,
      type: nil,
      token: nil,
      user_id: nil,
      client_id: nil,
      scopes: nil,
      expires_at: nil,
      revoked_at: nil,
      created_at: nil
    }

    test "list_tokens/0 returns all tokens" do
      token = token_fixture()
      assert Authentication.list_tokens() == [token]
    end

    test "get_token!/1 returns the token with given id" do
      token = token_fixture()
      assert Authentication.get_token!(token.id) == token
    end

    test "create_token/1 with valid data creates a token" do
      valid_attrs = %{
        id: "some id",
        type: "some type",
        token: "some token",
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: ["option1", "option2"],
        expires_at: ~U[2025-07-14 14:21:00Z],
        revoked_at: ~U[2025-07-14 14:21:00Z],
        created_at: ~U[2025-07-14 14:21:00Z]
      }

      assert {:ok, %Token{} = token} = Authentication.create_token(valid_attrs)
      assert token.id == "some id"
      assert token.type == "some type"
      assert token.token == "some token"
      assert token.user_id == "some user_id"
      assert token.client_id == "some client_id"
      assert token.scopes == ["option1", "option2"]
      assert token.expires_at == ~U[2025-07-14 14:21:00Z]
      assert token.revoked_at == ~U[2025-07-14 14:21:00Z]
      assert token.created_at == ~U[2025-07-14 14:21:00Z]
    end

    test "create_token/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authentication.create_token(@invalid_attrs)
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
        expires_at: ~U[2025-07-15 14:21:00Z],
        revoked_at: ~U[2025-07-15 14:21:00Z],
        created_at: ~U[2025-07-15 14:21:00Z]
      }

      assert {:ok, %Token{} = token} = Authentication.update_token(token, update_attrs)
      assert token.id == "some updated id"
      assert token.type == "some updated type"
      assert token.token == "some updated token"
      assert token.user_id == "some updated user_id"
      assert token.client_id == "some updated client_id"
      assert token.scopes == ["option1"]
      assert token.expires_at == ~U[2025-07-15 14:21:00Z]
      assert token.revoked_at == ~U[2025-07-15 14:21:00Z]
      assert token.created_at == ~U[2025-07-15 14:21:00Z]
    end

    test "update_token/2 with invalid data returns error changeset" do
      token = token_fixture()
      assert {:error, %Ecto.Changeset{}} = Authentication.update_token(token, @invalid_attrs)
      assert token == Authentication.get_token!(token.id)
    end

    test "delete_token/1 deletes the token" do
      token = token_fixture()
      assert {:ok, %Token{}} = Authentication.delete_token(token)
      assert_raise Ecto.NoResultsError, fn -> Authentication.get_token!(token.id) end
    end

    test "change_token/1 returns a token changeset" do
      token = token_fixture()
      assert %Ecto.Changeset{} = Authentication.change_token(token)
    end
  end
end
