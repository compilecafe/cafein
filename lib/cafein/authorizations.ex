defmodule Cafein.Authorizations do
  @moduledoc """
  The Authorizations context.
  """

  import Ecto.Query, warn: false
  alias Cafein.Repo

  alias Cafein.Authorizations.AuthorizationCode

  @doc """
  Returns the list of authorization_codes.

  ## Examples

      iex> list_authorization_codes()
      [%AuthorizationCode{}, ...]

  """
  def list_authorization_codes do
    Repo.all(AuthorizationCode)
  end

  @doc """
  Gets a single authorization_code.

  Raises `Ecto.NoResultsError` if the Authorization code does not exist.

  ## Examples

      iex> get_authorization_code!(123)
      %AuthorizationCode{}

      iex> get_authorization_code!(456)
      ** (Ecto.NoResultsError)

  """
  def get_authorization_code!(id), do: Repo.get!(AuthorizationCode, id)

  @doc """
  Creates a authorization_code.

  ## Examples

      iex> create_authorization_code(%{field: value})
      {:ok, %AuthorizationCode{}}

      iex> create_authorization_code(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_authorization_code(attrs \\ %{}) do
    %AuthorizationCode{}
    |> AuthorizationCode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a authorization_code.

  ## Examples

      iex> update_authorization_code(authorization_code, %{field: new_value})
      {:ok, %AuthorizationCode{}}

      iex> update_authorization_code(authorization_code, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_authorization_code(%AuthorizationCode{} = authorization_code, attrs) do
    authorization_code
    |> AuthorizationCode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a authorization_code.

  ## Examples

      iex> delete_authorization_code(authorization_code)
      {:ok, %AuthorizationCode{}}

      iex> delete_authorization_code(authorization_code)
      {:error, %Ecto.Changeset{}}

  """
  def delete_authorization_code(%AuthorizationCode{} = authorization_code) do
    Repo.delete(authorization_code)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking authorization_code changes.

  ## Examples

      iex> change_authorization_code(authorization_code)
      %Ecto.Changeset{data: %AuthorizationCode{}}

  """
  def change_authorization_code(%AuthorizationCode{} = authorization_code, attrs \\ %{}) do
    AuthorizationCode.changeset(authorization_code, attrs)
  end

  alias Cafein.Authorizations.Token

  @doc """
  Returns the list of tokens.

  ## Examples

      iex> list_tokens()
      [%Token{}, ...]

  """
  def list_tokens do
    Repo.all(Token)
  end

  @doc """
  Gets a single token.

  Raises `Ecto.NoResultsError` if the Token does not exist.

  ## Examples

      iex> get_token!(123)
      %Token{}

      iex> get_token!(456)
      ** (Ecto.NoResultsError)

  """
  def get_token!(id), do: Repo.get!(Token, id)

  @doc """
  Creates a token.

  ## Examples

      iex> create_token(%{field: value})
      {:ok, %Token{}}

      iex> create_token(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_token(attrs \\ %{}) do
    %Token{}
    |> Token.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a token.

  ## Examples

      iex> update_token(token, %{field: new_value})
      {:ok, %Token{}}

      iex> update_token(token, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_token(%Token{} = token, attrs) do
    token
    |> Token.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a token.

  ## Examples

      iex> delete_token(token)
      {:ok, %Token{}}

      iex> delete_token(token)
      {:error, %Ecto.Changeset{}}

  """
  def delete_token(%Token{} = token) do
    Repo.delete(token)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking token changes.

  ## Examples

      iex> change_token(token)
      %Ecto.Changeset{data: %Token{}}

  """
  def change_token(%Token{} = token, attrs \\ %{}) do
    Token.changeset(token, attrs)
  end
end
