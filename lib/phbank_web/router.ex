defmodule PhbankWeb.Router do
  use PhbankWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhbankWeb do
    pipe_through :browser
    get "/test", CurrentAccController, :test
    live("/", Live.CurrentAccs.Index)
    live "/current_accs", Live.CurrentAccs.Index
    live "/current_acc/:id", Live.CurrentAccs.Show
    live "/current_acc/:id/edit", Live.CurrentAccs.Edit

    resources "/current_acc", CurrentAccController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhbankWeb do
  #   pipe_through :api
  # end
end
