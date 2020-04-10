defmodule PhbankWeb.Live.CurrentAccs.Show do

  use Phoenix.LiveView
  alias Phbank.Deposits

  def mount(%{"id" => id}, _session, socket) do
    {:ok,
      assign(socket,
      current_acc: Deposits.get_current_acc!(id)
    ),
    layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def render(assigns) do
    PhbankWeb.CurrentAccView.render("show.html", assigns)
  end
end
