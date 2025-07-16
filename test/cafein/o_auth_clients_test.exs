defmodule Cafein.OAuthClientsTest do
  use Cafein.DataCase

  alias Cafein.OAuthClients

  describe "clients" do
    alias Cafein.OAuthClients.Client

    import Cafein.OAuthClientsFixtures

    @invalid_attrs %{
      id: nil,
      name: nil,
      client_id: nil,
      client_secret: nil,
      callback_url: nil,
      is_public: nil,
      user_id: nil
    }

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert OAuthClients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert OAuthClients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      valid_attrs = %{
        id: "some id",
        name: "some name",
        client_id: "some client_id",
        client_secret: "some client_secret",
        callback_url: "some callback_url",
        is_public: true,
        user_id: "some user_id"
      }

      assert {:ok, %Client{} = client} = OAuthClients.create_client(valid_attrs)
      assert client.id == "some id"
      assert client.name == "some name"
      assert client.client_id == "some client_id"
      assert client.client_secret == "some client_secret"
      assert client.callback_url == "some callback_url"
      assert client.is_public == true
      assert client.user_id == "some user_id"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OAuthClients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()

      update_attrs = %{
        id: "some updated id",
        name: "some updated name",
        client_id: "some updated client_id",
        client_secret: "some updated client_secret",
        callback_url: "some updated callback_url",
        is_public: false,
        user_id: "some updated user_id"
      }

      assert {:ok, %Client{} = client} = OAuthClients.update_client(client, update_attrs)
      assert client.id == "some updated id"
      assert client.name == "some updated name"
      assert client.client_id == "some updated client_id"
      assert client.client_secret == "some updated client_secret"
      assert client.callback_url == "some updated callback_url"
      assert client.is_public == false
      assert client.user_id == "some updated user_id"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = OAuthClients.update_client(client, @invalid_attrs)
      assert client == OAuthClients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = OAuthClients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> OAuthClients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = OAuthClients.change_client(client)
    end
  end

  describe "scopes" do
    alias Cafein.OAuthClients.Scope

    import Cafein.OAuthClientsFixtures

    @invalid_attrs %{id: nil, name: nil, description: nil, is_public: nil}

    test "list_scopes/0 returns all scopes" do
      scope = scope_fixture()
      assert OAuthClients.list_scopes() == [scope]
    end

    test "get_scope!/1 returns the scope with given id" do
      scope = scope_fixture()
      assert OAuthClients.get_scope!(scope.id) == scope
    end

    test "create_scope/1 with valid data creates a scope" do
      valid_attrs = %{
        id: "some id",
        name: "some name",
        description: "some description",
        is_public: true
      }

      assert {:ok, %Scope{} = scope} = OAuthClients.create_scope(valid_attrs)
      assert scope.id == "some id"
      assert scope.name == "some name"
      assert scope.description == "some description"
      assert scope.is_public == true
    end

    test "create_scope/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OAuthClients.create_scope(@invalid_attrs)
    end

    test "update_scope/2 with valid data updates the scope" do
      scope = scope_fixture()

      update_attrs = %{
        id: "some updated id",
        name: "some updated name",
        description: "some updated description",
        is_public: false
      }

      assert {:ok, %Scope{} = scope} = OAuthClients.update_scope(scope, update_attrs)
      assert scope.id == "some updated id"
      assert scope.name == "some updated name"
      assert scope.description == "some updated description"
      assert scope.is_public == false
    end

    test "update_scope/2 with invalid data returns error changeset" do
      scope = scope_fixture()
      assert {:error, %Ecto.Changeset{}} = OAuthClients.update_scope(scope, @invalid_attrs)
      assert scope == OAuthClients.get_scope!(scope.id)
    end

    test "delete_scope/1 deletes the scope" do
      scope = scope_fixture()
      assert {:ok, %Scope{}} = OAuthClients.delete_scope(scope)
      assert_raise Ecto.NoResultsError, fn -> OAuthClients.get_scope!(scope.id) end
    end

    test "change_scope/1 returns a scope changeset" do
      scope = scope_fixture()
      assert %Ecto.Changeset{} = OAuthClients.change_scope(scope)
    end
  end

  describe "client_scopes" do
    alias Cafein.OAuthClients.ClientScope

    import Cafein.OAuthClientsFixtures

    @invalid_attrs %{id: nil, scope_id: nil, client_id: nil}

    test "list_client_scopes/0 returns all client_scopes" do
      client_scope = client_scope_fixture()
      assert OAuthClients.list_client_scopes() == [client_scope]
    end

    test "get_client_scope!/1 returns the client_scope with given id" do
      client_scope = client_scope_fixture()
      assert OAuthClients.get_client_scope!(client_scope.id) == client_scope
    end

    test "create_client_scope/1 with valid data creates a client_scope" do
      valid_attrs = %{id: "some id", scope_id: "some scope_id", client_id: "some client_id"}

      assert {:ok, %ClientScope{} = client_scope} = OAuthClients.create_client_scope(valid_attrs)
      assert client_scope.id == "some id"
      assert client_scope.scope_id == "some scope_id"
      assert client_scope.client_id == "some client_id"
    end

    test "create_client_scope/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OAuthClients.create_client_scope(@invalid_attrs)
    end

    test "update_client_scope/2 with valid data updates the client_scope" do
      client_scope = client_scope_fixture()

      update_attrs = %{
        id: "some updated id",
        scope_id: "some updated scope_id",
        client_id: "some updated client_id"
      }

      assert {:ok, %ClientScope{} = client_scope} =
               OAuthClients.update_client_scope(client_scope, update_attrs)

      assert client_scope.id == "some updated id"
      assert client_scope.scope_id == "some updated scope_id"
      assert client_scope.client_id == "some updated client_id"
    end

    test "update_client_scope/2 with invalid data returns error changeset" do
      client_scope = client_scope_fixture()

      assert {:error, %Ecto.Changeset{}} =
               OAuthClients.update_client_scope(client_scope, @invalid_attrs)

      assert client_scope == OAuthClients.get_client_scope!(client_scope.id)
    end

    test "delete_client_scope/1 deletes the client_scope" do
      client_scope = client_scope_fixture()
      assert {:ok, %ClientScope{}} = OAuthClients.delete_client_scope(client_scope)
      assert_raise Ecto.NoResultsError, fn -> OAuthClients.get_client_scope!(client_scope.id) end
    end

    test "change_client_scope/1 returns a client_scope changeset" do
      client_scope = client_scope_fixture()
      assert %Ecto.Changeset{} = OAuthClients.change_client_scope(client_scope)
    end
  end
end
