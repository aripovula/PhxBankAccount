defmodule PhbankWeb.Live.CurrentAccs.Index do

  use Phoenix.LiveView

  alias Phbank.Deposits

  def mount(_params, _session, socket) do
    {:ok,
      assign(socket,
      val: 1,
      val2: false,
      values: nil,
      current_accs: Deposits.list_current_accs()
    ),
    layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def handle_event("nextPage", _, socket) do
    {:noreply, update(socket, :val, fn val -> val + 1 end)}
  end

  def handle_event("thisPage", _, socket) do
    {:noreply, update(socket, :val, fn val -> val end)}
  end

  def handle_event("prevPage", _, socket) do
    # {:noreply, update(socket, :val, fn val  -> val > 1 && val - 1 || val end)}
    {:noreply, update(socket, :val, fn
      val when val > 1 -> val - 1
      val when val <= 1 -> val
    end)}
  end

  def handle_event("search", _value, socket) do
    {:noreply, update(socket, :val2, fn x -> x |> Kernel.not end)}
    # {:noreply, assign(socket, values: value)}
  end

  def render(assigns) do
    IO.inspect(assigns)
    PhbankWeb.CurrentAccView.render("index.html", assigns)
  end
end
