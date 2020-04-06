defmodule PhbankWeb.Router do
  use PhbankWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhbankWeb do
    pipe_through :browser
    get "/current_accs/withdraw", CurrentAccController, :withdraw

    get "/", PageController, :index
    resources "/current_accs", CurrentAccController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhbankWeb do
  #   pipe_through :api
  # end
end
