defmodule Cafein.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cafein.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        email_verified_at: ~U[2025-07-15 00:20:00Z],
        id: "some id",
        password_hash: "some password_hash",
        phone: "some phone",
        phone_verified_at: ~U[2025-07-15 00:20:00Z],
        username: "some username"
      })
      |> Cafein.Accounts.create_user()

    user
  end

  @doc """
  Generate a recovery_phrase.
  """
  def recovery_phrase_fixture(attrs \\ %{}) do
    {:ok, recovery_phrase} =
      attrs
      |> Enum.into(%{
        id: "some id",
        phrases: "some phrases",
        used_at: ~U[2025-07-15 00:20:00Z],
        user_id: "some user_id"
      })
      |> Cafein.Accounts.create_recovery_phrase()

    recovery_phrase
  end

  @doc """
  Generate a security_question.
  """
  def security_question_fixture(attrs \\ %{}) do
    {:ok, security_question} =
      attrs
      |> Enum.into(%{
        deprecated_at: ~U[2025-07-15 00:21:00Z],
        id: "some id",
        question: "some question"
      })
      |> Cafein.Accounts.create_security_question()

    security_question
  end

  @doc """
  Generate a user_question_answer.
  """
  def user_question_answer_fixture(attrs \\ %{}) do
    {:ok, user_question_answer} =
      attrs
      |> Enum.into(%{
        answer_hash: "some answer_hash",
        answered_at: ~U[2025-07-15 00:21:00Z],
        deleted_at: ~U[2025-07-15 00:21:00Z],
        id: "some id",
        question_id: "some question_id",
        user_id: "some user_id"
      })
      |> Cafein.Accounts.create_user_question_answer()

    user_question_answer
  end
end
