defmodule PhbankWeb.Live.CurrentAccs.Show do

  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    # IO.inspect params
    IO.inspect socket
    {:ok,
      assign(socket,
      current_acc: "session.current_accs"
    ),
    layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def handle_event("nextPage", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("prevPage", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    IO.inspect(assigns)
    PhbankWeb.CurrentAccView.render("show.html", assigns)
  end
end
