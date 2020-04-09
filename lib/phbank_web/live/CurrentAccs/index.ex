defmodule PhbankWeb.Live.CurrentAccs.Index do

  use Phoenix.LiveView

  alias Phbank.Deposits

  def mount(_params, _session, socket) do
    {:ok,
      assign(socket,
      val: 0,
      val2: true,
      values: nil,
      current_accs: Deposits.list_current_accs()
    ),
    layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def handle_event("nextPage", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("prevPage", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_event("theid", _value, socket) do
    {:noreply, update(socket, :val2, fn x -> x |> Kernel.not end)}
    # {:noreply, assign(socket, values: value)}
  end

  def render(assigns) do
    IO.inspect(assigns)
    PhbankWeb.CurrentAccView.render("index.html", assigns)
  end
end
