defmodule JwtTestWeb.SessionView do
  use JwtTestWeb, :view
  alias JwtTestWeb.SessionView

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("error.json", %{error: error}) do
    %{error: error}
  end

  def render("success.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
