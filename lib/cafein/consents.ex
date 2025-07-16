defmodule Cafein.Consents do
  @moduledoc """
  The Consents context.
  """

  import Ecto.Query, warn: false
  alias Cafein.Repo

  alias Cafein.Consents.UserConsent

  @doc """
  Returns the list of user_consents.

  ## Examples

      iex> list_user_consents()
      [%UserConsent{}, ...]

  """
  def list_user_consents do
    Repo.all(UserConsent)
  end

  @doc """
  Gets a single user_consent.

  Raises `Ecto.NoResultsError` if the User consent does not exist.

  ## Examples

      iex> get_user_consent!(123)
      %UserConsent{}

      iex> get_user_consent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_consent!(id), do: Repo.get!(UserConsent, id)

  @doc """
  Creates a user_consent.

  ## Examples

      iex> create_user_consent(%{field: value})
      {:ok, %UserConsent{}}

      iex> create_user_consent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_consent(attrs \\ %{}) do
    %UserConsent{}
    |> UserConsent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_consent.

  ## Examples

      iex> update_user_consent(user_consent, %{field: new_value})
      {:ok, %UserConsent{}}

      iex> update_user_consent(user_consent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_consent(%UserConsent{} = user_consent, attrs) do
    user_consent
    |> UserConsent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_consent.

  ## Examples

      iex> delete_user_consent(user_consent)
      {:ok, %UserConsent{}}

      iex> delete_user_consent(user_consent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_consent(%UserConsent{} = user_consent) do
    Repo.delete(user_consent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_consent changes.

  ## Examples

      iex> change_user_consent(user_consent)
      %Ecto.Changeset{data: %UserConsent{}}

  """
  def change_user_consent(%UserConsent{} = user_consent, attrs \\ %{}) do
    UserConsent.changeset(user_consent, attrs)
  end
end
