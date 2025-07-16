defmodule Cafein.OAuthClients do
  @moduledoc """
  The OAuthClients context.
  """

  import Ecto.Query, warn: false
  alias Cafein.Repo

  alias Cafein.OAuthClients.Client

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{data: %Client{}}

  """
  def change_client(%Client{} = client, attrs \\ %{}) do
    Client.changeset(client, attrs)
  end

  alias Cafein.OAuthClients.Scope

  @doc """
  Returns the list of scopes.

  ## Examples

      iex> list_scopes()
      [%Scope{}, ...]

  """
  def list_scopes do
    Repo.all(Scope)
  end

  @doc """
  Gets a single scope.

  Raises `Ecto.NoResultsError` if the Scope does not exist.

  ## Examples

      iex> get_scope!(123)
      %Scope{}

      iex> get_scope!(456)
      ** (Ecto.NoResultsError)

  """
  def get_scope!(id), do: Repo.get!(Scope, id)

  @doc """
  Creates a scope.

  ## Examples

      iex> create_scope(%{field: value})
      {:ok, %Scope{}}

      iex> create_scope(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_scope(attrs \\ %{}) do
    %Scope{}
    |> Scope.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a scope.

  ## Examples

      iex> update_scope(scope, %{field: new_value})
      {:ok, %Scope{}}

      iex> update_scope(scope, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_scope(%Scope{} = scope, attrs) do
    scope
    |> Scope.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a scope.

  ## Examples

      iex> delete_scope(scope)
      {:ok, %Scope{}}

      iex> delete_scope(scope)
      {:error, %Ecto.Changeset{}}

  """
  def delete_scope(%Scope{} = scope) do
    Repo.delete(scope)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking scope changes.

  ## Examples

      iex> change_scope(scope)
      %Ecto.Changeset{data: %Scope{}}

  """
  def change_scope(%Scope{} = scope, attrs \\ %{}) do
    Scope.changeset(scope, attrs)
  end

  alias Cafein.OAuthClients.ClientScope

  @doc """
  Returns the list of client_scopes.

  ## Examples

      iex> list_client_scopes()
      [%ClientScope{}, ...]

  """
  def list_client_scopes do
    Repo.all(ClientScope)
  end

  @doc """
  Gets a single client_scope.

  Raises `Ecto.NoResultsError` if the Client scope does not exist.

  ## Examples

      iex> get_client_scope!(123)
      %ClientScope{}

      iex> get_client_scope!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client_scope!(id), do: Repo.get!(ClientScope, id)

  @doc """
  Creates a client_scope.

  ## Examples

      iex> create_client_scope(%{field: value})
      {:ok, %ClientScope{}}

      iex> create_client_scope(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client_scope(attrs \\ %{}) do
    %ClientScope{}
    |> ClientScope.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client_scope.

  ## Examples

      iex> update_client_scope(client_scope, %{field: new_value})
      {:ok, %ClientScope{}}

      iex> update_client_scope(client_scope, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client_scope(%ClientScope{} = client_scope, attrs) do
    client_scope
    |> ClientScope.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client_scope.

  ## Examples

      iex> delete_client_scope(client_scope)
      {:ok, %ClientScope{}}

      iex> delete_client_scope(client_scope)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client_scope(%ClientScope{} = client_scope) do
    Repo.delete(client_scope)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client_scope changes.

  ## Examples

      iex> change_client_scope(client_scope)
      %Ecto.Changeset{data: %ClientScope{}}

  """
  def change_client_scope(%ClientScope{} = client_scope, attrs \\ %{}) do
    ClientScope.changeset(client_scope, attrs)
  end
end
