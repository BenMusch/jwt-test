defmodule JwtTest.AuthTest do
  use JwtTest.DataCase

  alias JwtTest.Auth

  describe "sessions" do
    alias JwtTest.Auth.Session

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def session_fixture(attrs \\ %{}) do
      {:ok, session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_session()

      session
    end

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Auth.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Auth.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      assert {:ok, %Session{} = session} = Auth.create_session(@valid_attrs)
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      assert {:ok, session} = Auth.update_session(session, @update_attrs)
      assert %Session{} = session
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_session(session, @invalid_attrs)
      assert session == Auth.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Auth.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Auth.change_session(session)
    end
  end
end
