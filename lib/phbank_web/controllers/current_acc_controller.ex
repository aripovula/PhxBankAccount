defmodule PhbankWeb.CurrentAccController do
  use PhbankWeb, :controller

  import Phoenix.LiveView.Controller

  alias Phbank.Deposits
  alias Phbank.Deposits.CurrentAcc
  alias PhbankWeb.Live.CurrentAccs.{Index, Show}

  def index(conn, _params) do
    current_accs = Deposits.list_current_accs()
    live_render(conn, Index, current_accs: current_accs)
  end

  def new(conn, _params) do
    changeset = Deposits.change_current_acc(%CurrentAcc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"current_acc" => current_acc_params}) do
    case Deposits.create_current_acc(current_acc_params) do
      {:ok, current_acc} ->
        conn
        |> put_flash(:info, "Current acc created successfully.")
        |> redirect(to: Routes.current_acc_path(conn, :show, current_acc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    current_acc = Deposits.get_current_acc!(id)

    live_render(conn, Show, session: %{
      "current_acc" => current_acc
    })
  end

  def edit(conn, params) do
    IO.inspect "params1112="
    IO.inspect params
    %{"id" => id} = params
    # %{"_csrf_token" => _csrf_token} = params
    current_acc = Deposits.get_current_acc!(id)
    changeset = Deposits.change_current_acc(current_acc)
    render(conn, "edit.html", current_acc: current_acc, changeset: changeset)
  end

  def update(conn, %{"id" => id, "current_acc" => %{"balance"=>balance, "deposit" => deposit, "withdrawal" => withdrawal}}) do
    current_acc = Deposits.get_current_acc!(id)

    new_balance = CurrentAcc.countBalance(balance, deposit, withdrawal)

    case Deposits.update_balance!(id, new_balance) do
      {:ok, current_acc} ->
        conn
        |> put_flash(:info, "Current account updated successfully.")
        |> redirect(to: Routes.current_acc_path(conn, :show, current_acc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", current_acc: current_acc, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    current_acc = Deposits.get_current_acc!(id)
    {:ok, _current_acc} = Deposits.delete_current_acc(current_acc)

    conn
    |> put_flash(:info, "Current acc deleted successfully.")
    |> redirect(to: Routes.current_acc_path(conn, :index))
  end
end
