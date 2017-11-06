defmodule JwtTestWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use JwtTestWeb, :controller

  def call(conn, {:error}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(JwtTestWeb.ChangesetView, "error.json")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(JwtTestWeb.ErrorView, :"404")
  end
end
