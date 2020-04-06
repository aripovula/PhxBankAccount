defmodule PhbankWeb.CurrentAccControllerTest do
  use PhbankWeb.ConnCase

  alias Phbank.Deposits

  @create_attrs %{accountNumber: "some accountNumber", balance: 120.5, status: "some status"}
  @update_attrs %{accountNumber: "some updated accountNumber", balance: 456.7, status: "some updated status"}
  @invalid_attrs %{accountNumber: nil, balance: nil, status: nil}

  def fixture(:current_acc) do
    {:ok, current_acc} = Deposits.create_current_acc(@create_attrs)
    current_acc
  end

  describe "index" do
    # test "lists all current_accs", %{conn: conn} do
    #   conn = get(conn, Routes.current_acc_path(conn, :index))
    #   assert html_response(conn, 200) =~ "Listing Current accs"
    # end
  end

  describe "new current_acc" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.current_acc_path(conn, :new))
      assert html_response(conn, 200) =~ "New Current acc"
    end
  end

  describe "create current_acc" do
    # test "redirects to show when data is valid", %{conn: conn} do
    #   conn = post(conn, Routes.current_acc_path(conn, :create), current_acc: @create_attrs)

    #   assert %{id: id} = redirected_params(conn)
    #   assert redirected_to(conn) == Routes.current_acc_path(conn, :show, id)

    #   conn = get(conn, Routes.current_acc_path(conn, :show, id))
    #   assert html_response(conn, 200) =~ "Show Current acc"
    # end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.current_acc_path(conn, :create), current_acc: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Current acc"
    end
  end

  describe "edit current_acc" do
    setup [:create_current_acc]

    # test "renders form for editing chosen current_acc", %{conn: conn, current_acc: current_acc} do
    #   conn = get(conn, Routes.current_acc_path(conn, :edit, current_acc))
    #   assert html_response(conn, 200) =~ "Edit Current acc"
    # end
  end

  describe "update current_acc" do
    setup [:create_current_acc]

    # test "redirects when data is valid", %{conn: conn, current_acc: current_acc} do
    #   conn = put(conn, Routes.current_acc_path(conn, :update, current_acc), current_acc: @update_attrs)
    #   assert redirected_to(conn) == Routes.current_acc_path(conn, :show, current_acc)

    #   conn = get(conn, Routes.current_acc_path(conn, :show, current_acc))
    #   assert html_response(conn, 200) =~ "some updated accountNumber"
    # end

    # test "renders errors when data is invalid", %{conn: conn, current_acc: current_acc} do
    #   conn = put(conn, Routes.current_acc_path(conn, :update, current_acc), current_acc: @invalid_attrs)
    #   assert html_response(conn, 200) =~ "Edit Current acc"
    # end
  end

  describe "delete current_acc" do
    setup [:create_current_acc]

    test "deletes chosen current_acc", %{conn: conn, current_acc: current_acc} do
      conn = delete(conn, Routes.current_acc_path(conn, :delete, current_acc))
      assert redirected_to(conn) == Routes.current_acc_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.current_acc_path(conn, :show, current_acc))
      end
    end
  end

  defp create_current_acc(_) do
    current_acc = fixture(:current_acc)
    {:ok, current_acc: current_acc}
  end
end
