defmodule PhbankWeb.CurrentAccs do
  use Phoenix.LiveView

  alias Phbank.Deposits

  # def mount(%{identifier: identifier, courses: courses} = session, socket) do
  #   :ok = GeoRacerWeb.Endpoint.subscribe(@topic <> identifier)
  #   selected_tab = if Enum.empty?(courses), do: :public, else: :private

  #   {:ok,
  #    assign(socket,
  #      position: nil,
  #      courses: %{private: courses, public: session.public_courses},
  #      identifier: identifier,
  #      selected_tab: selected_tab
  #    )}
  # end
  def mount(_params, _session, socket) do
    {:ok,
      assign(socket,
      val: 0,
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

  def render(assigns) do
    IO.inspect(assigns)
    PhbankWeb.PageView.render("current_accs.html", assigns)
  end
end
