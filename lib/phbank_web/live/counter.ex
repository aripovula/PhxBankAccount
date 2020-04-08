defmodule PhbankWeb.Counter do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :val, 0),
      layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    PhbankWeb.PageView.render("counter.html", assigns)
  end
end
