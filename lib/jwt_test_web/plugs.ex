defmodule JwtTestWeb.Plugs do
  import Plug.Conn
  require Logger

  def set_auth(conn, _opts) do
    [auth] = get_req_header(conn, "authorization")
    case Phoenix.Token.verify(JwtTestWeb.Endpoint, "username", auth, max_age: 86400) do
      {:ok, username} ->
        assign(conn, :auth, username)
      {:error, _} ->
        assign(conn, :auth, nil)
    end
  end
end
