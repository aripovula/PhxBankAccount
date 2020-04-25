defmodule PhbankWeb.Live.CurrentAccs.Edit do

  use Phoenix.LiveView

  alias Phbank.Deposits

  def mount(%{"id" => id}, _session, socket) do
    current_acc = Deposits.get_current_acc!(id)
    changeset = Deposits.change_current_acc(current_acc)

    {:ok,
      assign(socket,
      val: 1,
      val2: true,
      values: nil,
      current_acc: current_acc,
      changeset: changeset
    ),
    layout: {PhbankWeb.LayoutView, "app.html"}}
  end

  def handle_event("nextPage", _, socket) do
    {:noreply, update(socket, :val, fn val -> val + 1 end)}
  end

  def handle_event("prevPage", _, socket) do
    {:noreply, update(socket, :val, fn val when val <= 1 -> val end)}
    {:noreply, update(socket, :val, fn val when val > 1 -> val - 1 end)}
  end

  def handle_event("theid", _value, socket) do
    {:noreply, update(socket, :val2, fn x -> x |> Kernel.not end)}
    # {:noreply, assign(socket, values: value)}
  end

  def render(assigns) do
    IO.inspect(assigns)
    PhbankWeb.CurrentAccView.render("edit.html", assigns)
  end
end
