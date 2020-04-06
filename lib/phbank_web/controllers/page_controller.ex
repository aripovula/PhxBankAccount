defmodule PhbankWeb.PageController do
  use PhbankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
