defmodule JwtTestWeb.SessionController do
  use JwtTestWeb, :controller

  alias JwtTest.Auth

  action_fallback JwtTestWeb.FallbackController

  def create(conn, %{"username" => username, "password" => password}) do
    if username == "ben" && password == "password" do
      token = Phoenix.Token.sign(JwtTestWeb.Endpoint, "username", username)
      conn
      |> put_status(201)
      |> render("success.json", jwt: token)
    else
      conn
      |> put_status(401)
      |> render("error.json", error: "Bad login")
    end
  end

  def show(conn, _) do
    if conn.assigns[:auth] do
      conn
      |> render("show.json", username: conn.assigns[:auth])
    else
      conn
      |> put_status(401)
      |> render("error.json", error: "You must be logged in. Try posting to /sessions")
    end
  end
end
