defmodule JwtTestWeb.SessionView do
  use JwtTestWeb, :view
  alias JwtTestWeb.SessionView

  def render("show.json", %{username: username}) do
    %{message: "Hello! You're signed in as #{username}!"}
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end

  def render("success.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
