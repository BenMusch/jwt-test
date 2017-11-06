defmodule JwtTestWeb.PageController do
  use JwtTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
