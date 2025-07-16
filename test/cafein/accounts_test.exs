defmodule Cafein.AccountsTest do
  use Cafein.DataCase

  alias Cafein.Accounts

  describe "users" do
    alias Cafein.Accounts.User

    import Cafein.AccountsFixtures

    @invalid_attrs %{
      id: nil,
      username: nil,
      password_hash: nil,
      email: nil,
      email_verified_at: nil,
      phone: nil,
      phone_verified_at: nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        id: "some id",
        username: "some username",
        password_hash: "some password_hash",
        email: "some email",
        email_verified_at: ~U[2025-07-15 00:08:00Z],
        phone: "some phone",
        phone_verified_at: ~U[2025-07-15 00:08:00Z]
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.id == "some id"
      assert user.username == "some username"
      assert user.password_hash == "some password_hash"
      assert user.email == "some email"
      assert user.email_verified_at == ~U[2025-07-15 00:08:00Z]
      assert user.phone == "some phone"
      assert user.phone_verified_at == ~U[2025-07-15 00:08:00Z]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        id: "some updated id",
        username: "some updated username",
        password_hash: "some updated password_hash",
        email: "some updated email",
        email_verified_at: ~U[2025-07-16 00:08:00Z],
        phone: "some updated phone",
        phone_verified_at: ~U[2025-07-16 00:08:00Z]
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.id == "some updated id"
      assert user.username == "some updated username"
      assert user.password_hash == "some updated password_hash"
      assert user.email == "some updated email"
      assert user.email_verified_at == ~U[2025-07-16 00:08:00Z]
      assert user.phone == "some updated phone"
      assert user.phone_verified_at == ~U[2025-07-16 00:08:00Z]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "recovery_phrases" do
    alias Cafein.Accounts.RecoveryPhrase

    import Cafein.AccountsFixtures

    @invalid_attrs %{user_id: nil, phrases: nil, used_at: nil}

    test "list_recovery_phrases/0 returns all recovery_phrases" do
      recovery_phrase = recovery_phrase_fixture()
      assert Accounts.list_recovery_phrases() == [recovery_phrase]
    end

    test "get_recovery_phrase!/1 returns the recovery_phrase with given id" do
      recovery_phrase = recovery_phrase_fixture()
      assert Accounts.get_recovery_phrase!(recovery_phrase.id) == recovery_phrase
    end

    test "create_recovery_phrase/1 with valid data creates a recovery_phrase" do
      valid_attrs = %{
        user_id: "some user_id",
        phrases: "some phrases",
        used_at: ~U[2025-07-15 00:10:00Z]
      }

      assert {:ok, %RecoveryPhrase{} = recovery_phrase} =
               Accounts.create_recovery_phrase(valid_attrs)

      assert recovery_phrase.user_id == "some user_id"
      assert recovery_phrase.phrases == "some phrases"
      assert recovery_phrase.used_at == ~U[2025-07-15 00:10:00Z]
    end

    test "create_recovery_phrase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_recovery_phrase(@invalid_attrs)
    end

    test "update_recovery_phrase/2 with valid data updates the recovery_phrase" do
      recovery_phrase = recovery_phrase_fixture()

      update_attrs = %{
        user_id: "some updated user_id",
        phrases: "some updated phrases",
        used_at: ~U[2025-07-16 00:10:00Z]
      }

      assert {:ok, %RecoveryPhrase{} = recovery_phrase} =
               Accounts.update_recovery_phrase(recovery_phrase, update_attrs)

      assert recovery_phrase.user_id == "some updated user_id"
      assert recovery_phrase.phrases == "some updated phrases"
      assert recovery_phrase.used_at == ~U[2025-07-16 00:10:00Z]
    end

    test "update_recovery_phrase/2 with invalid data returns error changeset" do
      recovery_phrase = recovery_phrase_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_recovery_phrase(recovery_phrase, @invalid_attrs)

      assert recovery_phrase == Accounts.get_recovery_phrase!(recovery_phrase.id)
    end

    test "delete_recovery_phrase/1 deletes the recovery_phrase" do
      recovery_phrase = recovery_phrase_fixture()
      assert {:ok, %RecoveryPhrase{}} = Accounts.delete_recovery_phrase(recovery_phrase)

      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_recovery_phrase!(recovery_phrase.id)
      end
    end

    test "change_recovery_phrase/1 returns a recovery_phrase changeset" do
      recovery_phrase = recovery_phrase_fixture()
      assert %Ecto.Changeset{} = Accounts.change_recovery_phrase(recovery_phrase)
    end
  end

  describe "security_questions" do
    alias Cafein.Accounts.SecurityQuestion

    import Cafein.AccountsFixtures

    @invalid_attrs %{question: nil, deprecated_at: nil}

    test "list_security_questions/0 returns all security_questions" do
      security_question = security_question_fixture()
      assert Accounts.list_security_questions() == [security_question]
    end

    test "get_security_question!/1 returns the security_question with given id" do
      security_question = security_question_fixture()
      assert Accounts.get_security_question!(security_question.id) == security_question
    end

    test "create_security_question/1 with valid data creates a security_question" do
      valid_attrs = %{question: "some question", deprecated_at: ~U[2025-07-15 00:12:00Z]}

      assert {:ok, %SecurityQuestion{} = security_question} =
               Accounts.create_security_question(valid_attrs)

      assert security_question.question == "some question"
      assert security_question.deprecated_at == ~U[2025-07-15 00:12:00Z]
    end

    test "create_security_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_security_question(@invalid_attrs)
    end

    test "update_security_question/2 with valid data updates the security_question" do
      security_question = security_question_fixture()
      update_attrs = %{question: "some updated question", deprecated_at: ~U[2025-07-16 00:12:00Z]}

      assert {:ok, %SecurityQuestion{} = security_question} =
               Accounts.update_security_question(security_question, update_attrs)

      assert security_question.question == "some updated question"
      assert security_question.deprecated_at == ~U[2025-07-16 00:12:00Z]
    end

    test "update_security_question/2 with invalid data returns error changeset" do
      security_question = security_question_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_security_question(security_question, @invalid_attrs)

      assert security_question == Accounts.get_security_question!(security_question.id)
    end

    test "delete_security_question/1 deletes the security_question" do
      security_question = security_question_fixture()
      assert {:ok, %SecurityQuestion{}} = Accounts.delete_security_question(security_question)

      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_security_question!(security_question.id)
      end
    end

    test "change_security_question/1 returns a security_question changeset" do
      security_question = security_question_fixture()
      assert %Ecto.Changeset{} = Accounts.change_security_question(security_question)
    end
  end

  describe "user_consents" do
    alias Cafein.Accounts.UserConsent

    import Cafein.AccountsFixtures

    @invalid_attrs %{user_id: nil, client_id: nil, scopes: nil, granted_at: nil, revoked_at: nil}

    test "list_user_consents/0 returns all user_consents" do
      user_consent = user_consent_fixture()
      assert Accounts.list_user_consents() == [user_consent]
    end

    test "get_user_consent!/1 returns the user_consent with given id" do
      user_consent = user_consent_fixture()
      assert Accounts.get_user_consent!(user_consent.id) == user_consent
    end

    test "create_user_consent/1 with valid data creates a user_consent" do
      valid_attrs = %{
        user_id: "some user_id",
        client_id: "some client_id",
        scopes: ["option1", "option2"],
        granted_at: ~U[2025-07-15 00:13:00Z],
        revoked_at: ~U[2025-07-15 00:13:00Z]
      }

      assert {:ok, %UserConsent{} = user_consent} = Accounts.create_user_consent(valid_attrs)
      assert user_consent.user_id == "some user_id"
      assert user_consent.client_id == "some client_id"
      assert user_consent.scopes == ["option1", "option2"]
      assert user_consent.granted_at == ~U[2025-07-15 00:13:00Z]
      assert user_consent.revoked_at == ~U[2025-07-15 00:13:00Z]
    end

    test "create_user_consent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_consent(@invalid_attrs)
    end

    test "update_user_consent/2 with valid data updates the user_consent" do
      user_consent = user_consent_fixture()

      update_attrs = %{
        user_id: "some updated user_id",
        client_id: "some updated client_id",
        scopes: ["option1"],
        granted_at: ~U[2025-07-16 00:13:00Z],
        revoked_at: ~U[2025-07-16 00:13:00Z]
      }

      assert {:ok, %UserConsent{} = user_consent} =
               Accounts.update_user_consent(user_consent, update_attrs)

      assert user_consent.user_id == "some updated user_id"
      assert user_consent.client_id == "some updated client_id"
      assert user_consent.scopes == ["option1"]
      assert user_consent.granted_at == ~U[2025-07-16 00:13:00Z]
      assert user_consent.revoked_at == ~U[2025-07-16 00:13:00Z]
    end

    test "update_user_consent/2 with invalid data returns error changeset" do
      user_consent = user_consent_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_user_consent(user_consent, @invalid_attrs)

      assert user_consent == Accounts.get_user_consent!(user_consent.id)
    end

    test "delete_user_consent/1 deletes the user_consent" do
      user_consent = user_consent_fixture()
      assert {:ok, %UserConsent{}} = Accounts.delete_user_consent(user_consent)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_consent!(user_consent.id) end
    end

    test "change_user_consent/1 returns a user_consent changeset" do
      user_consent = user_consent_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_consent(user_consent)
    end
  end

  describe "users" do
    alias Cafein.Accounts.User

    import Cafein.AccountsFixtures

    @invalid_attrs %{akjncka: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{akjncka: "some akjncka"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.akjncka == "some akjncka"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{akjncka: "some updated akjncka"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.akjncka == "some updated akjncka"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias Cafein.Accounts.User

    import Cafein.AccountsFixtures

    @invalid_attrs %{
      id: nil,
      username: nil,
      password_hash: nil,
      email: nil,
      email_verified_at: nil,
      phone: nil,
      phone_verified_at: nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        id: "some id",
        username: "some username",
        password_hash: "some password_hash",
        email: "some email",
        email_verified_at: ~U[2025-07-15 00:20:00Z],
        phone: "some phone",
        phone_verified_at: ~U[2025-07-15 00:20:00Z]
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.id == "some id"
      assert user.username == "some username"
      assert user.password_hash == "some password_hash"
      assert user.email == "some email"
      assert user.email_verified_at == ~U[2025-07-15 00:20:00Z]
      assert user.phone == "some phone"
      assert user.phone_verified_at == ~U[2025-07-15 00:20:00Z]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        id: "some updated id",
        username: "some updated username",
        password_hash: "some updated password_hash",
        email: "some updated email",
        email_verified_at: ~U[2025-07-16 00:20:00Z],
        phone: "some updated phone",
        phone_verified_at: ~U[2025-07-16 00:20:00Z]
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.id == "some updated id"
      assert user.username == "some updated username"
      assert user.password_hash == "some updated password_hash"
      assert user.email == "some updated email"
      assert user.email_verified_at == ~U[2025-07-16 00:20:00Z]
      assert user.phone == "some updated phone"
      assert user.phone_verified_at == ~U[2025-07-16 00:20:00Z]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "recovery_phrases" do
    alias Cafein.Accounts.RecoveryPhrase

    import Cafein.AccountsFixtures

    @invalid_attrs %{id: nil, user_id: nil, phrases: nil, used_at: nil}

    test "list_recovery_phrases/0 returns all recovery_phrases" do
      recovery_phrase = recovery_phrase_fixture()
      assert Accounts.list_recovery_phrases() == [recovery_phrase]
    end

    test "get_recovery_phrase!/1 returns the recovery_phrase with given id" do
      recovery_phrase = recovery_phrase_fixture()
      assert Accounts.get_recovery_phrase!(recovery_phrase.id) == recovery_phrase
    end

    test "create_recovery_phrase/1 with valid data creates a recovery_phrase" do
      valid_attrs = %{
        id: "some id",
        user_id: "some user_id",
        phrases: "some phrases",
        used_at: ~U[2025-07-15 00:20:00Z]
      }

      assert {:ok, %RecoveryPhrase{} = recovery_phrase} =
               Accounts.create_recovery_phrase(valid_attrs)

      assert recovery_phrase.id == "some id"
      assert recovery_phrase.user_id == "some user_id"
      assert recovery_phrase.phrases == "some phrases"
      assert recovery_phrase.used_at == ~U[2025-07-15 00:20:00Z]
    end

    test "create_recovery_phrase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_recovery_phrase(@invalid_attrs)
    end

    test "update_recovery_phrase/2 with valid data updates the recovery_phrase" do
      recovery_phrase = recovery_phrase_fixture()

      update_attrs = %{
        id: "some updated id",
        user_id: "some updated user_id",
        phrases: "some updated phrases",
        used_at: ~U[2025-07-16 00:20:00Z]
      }

      assert {:ok, %RecoveryPhrase{} = recovery_phrase} =
               Accounts.update_recovery_phrase(recovery_phrase, update_attrs)

      assert recovery_phrase.id == "some updated id"
      assert recovery_phrase.user_id == "some updated user_id"
      assert recovery_phrase.phrases == "some updated phrases"
      assert recovery_phrase.used_at == ~U[2025-07-16 00:20:00Z]
    end

    test "update_recovery_phrase/2 with invalid data returns error changeset" do
      recovery_phrase = recovery_phrase_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_recovery_phrase(recovery_phrase, @invalid_attrs)

      assert recovery_phrase == Accounts.get_recovery_phrase!(recovery_phrase.id)
    end

    test "delete_recovery_phrase/1 deletes the recovery_phrase" do
      recovery_phrase = recovery_phrase_fixture()
      assert {:ok, %RecoveryPhrase{}} = Accounts.delete_recovery_phrase(recovery_phrase)

      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_recovery_phrase!(recovery_phrase.id)
      end
    end

    test "change_recovery_phrase/1 returns a recovery_phrase changeset" do
      recovery_phrase = recovery_phrase_fixture()
      assert %Ecto.Changeset{} = Accounts.change_recovery_phrase(recovery_phrase)
    end
  end

  describe "security_questions" do
    alias Cafein.Accounts.SecurityQuestion

    import Cafein.AccountsFixtures

    @invalid_attrs %{id: nil, question: nil, deprecated_at: nil}

    test "list_security_questions/0 returns all security_questions" do
      security_question = security_question_fixture()
      assert Accounts.list_security_questions() == [security_question]
    end

    test "get_security_question!/1 returns the security_question with given id" do
      security_question = security_question_fixture()
      assert Accounts.get_security_question!(security_question.id) == security_question
    end

    test "create_security_question/1 with valid data creates a security_question" do
      valid_attrs = %{
        id: "some id",
        question: "some question",
        deprecated_at: ~U[2025-07-15 00:21:00Z]
      }

      assert {:ok, %SecurityQuestion{} = security_question} =
               Accounts.create_security_question(valid_attrs)

      assert security_question.id == "some id"
      assert security_question.question == "some question"
      assert security_question.deprecated_at == ~U[2025-07-15 00:21:00Z]
    end

    test "create_security_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_security_question(@invalid_attrs)
    end

    test "update_security_question/2 with valid data updates the security_question" do
      security_question = security_question_fixture()

      update_attrs = %{
        id: "some updated id",
        question: "some updated question",
        deprecated_at: ~U[2025-07-16 00:21:00Z]
      }

      assert {:ok, %SecurityQuestion{} = security_question} =
               Accounts.update_security_question(security_question, update_attrs)

      assert security_question.id == "some updated id"
      assert security_question.question == "some updated question"
      assert security_question.deprecated_at == ~U[2025-07-16 00:21:00Z]
    end

    test "update_security_question/2 with invalid data returns error changeset" do
      security_question = security_question_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_security_question(security_question, @invalid_attrs)

      assert security_question == Accounts.get_security_question!(security_question.id)
    end

    test "delete_security_question/1 deletes the security_question" do
      security_question = security_question_fixture()
      assert {:ok, %SecurityQuestion{}} = Accounts.delete_security_question(security_question)

      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_security_question!(security_question.id)
      end
    end

    test "change_security_question/1 returns a security_question changeset" do
      security_question = security_question_fixture()
      assert %Ecto.Changeset{} = Accounts.change_security_question(security_question)
    end
  end

  describe "user_question_answers" do
    alias Cafein.Accounts.UserQuestionAnswer

    import Cafein.AccountsFixtures

    @invalid_attrs %{
      id: nil,
      user_id: nil,
      question_id: nil,
      answer_hash: nil,
      answered_at: nil,
      deleted_at: nil
    }

    test "list_user_question_answers/0 returns all user_question_answers" do
      user_question_answer = user_question_answer_fixture()
      assert Accounts.list_user_question_answers() == [user_question_answer]
    end

    test "get_user_question_answer!/1 returns the user_question_answer with given id" do
      user_question_answer = user_question_answer_fixture()
      assert Accounts.get_user_question_answer!(user_question_answer.id) == user_question_answer
    end

    test "create_user_question_answer/1 with valid data creates a user_question_answer" do
      valid_attrs = %{
        id: "some id",
        user_id: "some user_id",
        question_id: "some question_id",
        answer_hash: "some answer_hash",
        answered_at: ~U[2025-07-15 00:21:00Z],
        deleted_at: ~U[2025-07-15 00:21:00Z]
      }

      assert {:ok, %UserQuestionAnswer{} = user_question_answer} =
               Accounts.create_user_question_answer(valid_attrs)

      assert user_question_answer.id == "some id"
      assert user_question_answer.user_id == "some user_id"
      assert user_question_answer.question_id == "some question_id"
      assert user_question_answer.answer_hash == "some answer_hash"
      assert user_question_answer.answered_at == ~U[2025-07-15 00:21:00Z]
      assert user_question_answer.deleted_at == ~U[2025-07-15 00:21:00Z]
    end

    test "create_user_question_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_question_answer(@invalid_attrs)
    end

    test "update_user_question_answer/2 with valid data updates the user_question_answer" do
      user_question_answer = user_question_answer_fixture()

      update_attrs = %{
        id: "some updated id",
        user_id: "some updated user_id",
        question_id: "some updated question_id",
        answer_hash: "some updated answer_hash",
        answered_at: ~U[2025-07-16 00:21:00Z],
        deleted_at: ~U[2025-07-16 00:21:00Z]
      }

      assert {:ok, %UserQuestionAnswer{} = user_question_answer} =
               Accounts.update_user_question_answer(user_question_answer, update_attrs)

      assert user_question_answer.id == "some updated id"
      assert user_question_answer.user_id == "some updated user_id"
      assert user_question_answer.question_id == "some updated question_id"
      assert user_question_answer.answer_hash == "some updated answer_hash"
      assert user_question_answer.answered_at == ~U[2025-07-16 00:21:00Z]
      assert user_question_answer.deleted_at == ~U[2025-07-16 00:21:00Z]
    end

    test "update_user_question_answer/2 with invalid data returns error changeset" do
      user_question_answer = user_question_answer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Accounts.update_user_question_answer(user_question_answer, @invalid_attrs)

      assert user_question_answer == Accounts.get_user_question_answer!(user_question_answer.id)
    end

    test "delete_user_question_answer/1 deletes the user_question_answer" do
      user_question_answer = user_question_answer_fixture()

      assert {:ok, %UserQuestionAnswer{}} =
               Accounts.delete_user_question_answer(user_question_answer)

      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get_user_question_answer!(user_question_answer.id)
      end
    end

    test "change_user_question_answer/1 returns a user_question_answer changeset" do
      user_question_answer = user_question_answer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_question_answer(user_question_answer)
    end
  end
end
