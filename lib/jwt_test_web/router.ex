defmodule JwtTestWeb.Router do
  use JwtTestWeb, :router
  import JwtTestWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :set_auth
  end

  scope "/sessions", JwtTestWeb do
    pipe_through :api # Use the default browser stack

    post "/", SessionController, :create
    get "/", SessionController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", JwtTestWeb do
  #   pipe_through :api
  # end
end
