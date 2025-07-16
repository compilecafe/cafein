defmodule Cafein.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Cafein.Repo

  alias Cafein.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Cafein.Accounts.RecoveryPhrase

  @doc """
  Returns the list of recovery_phrases.

  ## Examples

      iex> list_recovery_phrases()
      [%RecoveryPhrase{}, ...]

  """
  def list_recovery_phrases do
    Repo.all(RecoveryPhrase)
  end

  @doc """
  Gets a single recovery_phrase.

  Raises `Ecto.NoResultsError` if the Recovery phrase does not exist.

  ## Examples

      iex> get_recovery_phrase!(123)
      %RecoveryPhrase{}

      iex> get_recovery_phrase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recovery_phrase!(id), do: Repo.get!(RecoveryPhrase, id)

  @doc """
  Creates a recovery_phrase.

  ## Examples

      iex> create_recovery_phrase(%{field: value})
      {:ok, %RecoveryPhrase{}}

      iex> create_recovery_phrase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recovery_phrase(attrs \\ %{}) do
    %RecoveryPhrase{}
    |> RecoveryPhrase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recovery_phrase.

  ## Examples

      iex> update_recovery_phrase(recovery_phrase, %{field: new_value})
      {:ok, %RecoveryPhrase{}}

      iex> update_recovery_phrase(recovery_phrase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recovery_phrase(%RecoveryPhrase{} = recovery_phrase, attrs) do
    recovery_phrase
    |> RecoveryPhrase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recovery_phrase.

  ## Examples

      iex> delete_recovery_phrase(recovery_phrase)
      {:ok, %RecoveryPhrase{}}

      iex> delete_recovery_phrase(recovery_phrase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recovery_phrase(%RecoveryPhrase{} = recovery_phrase) do
    Repo.delete(recovery_phrase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recovery_phrase changes.

  ## Examples

      iex> change_recovery_phrase(recovery_phrase)
      %Ecto.Changeset{data: %RecoveryPhrase{}}

  """
  def change_recovery_phrase(%RecoveryPhrase{} = recovery_phrase, attrs \\ %{}) do
    RecoveryPhrase.changeset(recovery_phrase, attrs)
  end

  alias Cafein.Accounts.SecurityQuestion

  @doc """
  Returns the list of security_questions.

  ## Examples

      iex> list_security_questions()
      [%SecurityQuestion{}, ...]

  """
  def list_security_questions do
    Repo.all(SecurityQuestion)
  end

  @doc """
  Gets a single security_question.

  Raises `Ecto.NoResultsError` if the Security question does not exist.

  ## Examples

      iex> get_security_question!(123)
      %SecurityQuestion{}

      iex> get_security_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_security_question!(id), do: Repo.get!(SecurityQuestion, id)

  @doc """
  Creates a security_question.

  ## Examples

      iex> create_security_question(%{field: value})
      {:ok, %SecurityQuestion{}}

      iex> create_security_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_security_question(attrs \\ %{}) do
    %SecurityQuestion{}
    |> SecurityQuestion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a security_question.

  ## Examples

      iex> update_security_question(security_question, %{field: new_value})
      {:ok, %SecurityQuestion{}}

      iex> update_security_question(security_question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_security_question(%SecurityQuestion{} = security_question, attrs) do
    security_question
    |> SecurityQuestion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a security_question.

  ## Examples

      iex> delete_security_question(security_question)
      {:ok, %SecurityQuestion{}}

      iex> delete_security_question(security_question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_security_question(%SecurityQuestion{} = security_question) do
    Repo.delete(security_question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking security_question changes.

  ## Examples

      iex> change_security_question(security_question)
      %Ecto.Changeset{data: %SecurityQuestion{}}

  """
  def change_security_question(%SecurityQuestion{} = security_question, attrs \\ %{}) do
    SecurityQuestion.changeset(security_question, attrs)
  end

  alias Cafein.Accounts.UserQuestionAnswer

  @doc """
  Returns the list of user_question_answers.

  ## Examples

      iex> list_user_question_answers()
      [%UserQuestionAnswer{}, ...]

  """
  def list_user_question_answers do
    Repo.all(UserQuestionAnswer)
  end

  @doc """
  Gets a single user_question_answer.

  Raises `Ecto.NoResultsError` if the User question answer does not exist.

  ## Examples

      iex> get_user_question_answer!(123)
      %UserQuestionAnswer{}

      iex> get_user_question_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_question_answer!(id), do: Repo.get!(UserQuestionAnswer, id)

  @doc """
  Creates a user_question_answer.

  ## Examples

      iex> create_user_question_answer(%{field: value})
      {:ok, %UserQuestionAnswer{}}

      iex> create_user_question_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_question_answer(attrs \\ %{}) do
    %UserQuestionAnswer{}
    |> UserQuestionAnswer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_question_answer.

  ## Examples

      iex> update_user_question_answer(user_question_answer, %{field: new_value})
      {:ok, %UserQuestionAnswer{}}

      iex> update_user_question_answer(user_question_answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_question_answer(%UserQuestionAnswer{} = user_question_answer, attrs) do
    user_question_answer
    |> UserQuestionAnswer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_question_answer.

  ## Examples

      iex> delete_user_question_answer(user_question_answer)
      {:ok, %UserQuestionAnswer{}}

      iex> delete_user_question_answer(user_question_answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_question_answer(%UserQuestionAnswer{} = user_question_answer) do
    Repo.delete(user_question_answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_question_answer changes.

  ## Examples

      iex> change_user_question_answer(user_question_answer)
      %Ecto.Changeset{data: %UserQuestionAnswer{}}

  """
  def change_user_question_answer(%UserQuestionAnswer{} = user_question_answer, attrs \\ %{}) do
    UserQuestionAnswer.changeset(user_question_answer, attrs)
  end
end
