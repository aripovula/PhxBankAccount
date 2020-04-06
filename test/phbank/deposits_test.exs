defmodule Phbank.DepositsTest do
  use Phbank.DataCase

  alias Phbank.Deposits

  describe "current_accs" do
    alias Phbank.Deposits.CurrentAcc

    @valid_attrs %{accountNumber: "some accountNumber", balance: 120.5, status: "some status"}
    @update_attrs %{accountNumber: "some updated accountNumber", balance: 456.7, status: "some updated status"}
    @invalid_attrs %{accountNumber: nil, balance: nil, status: nil}

    def current_acc_fixture(attrs \\ %{}) do
      {:ok, current_acc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Deposits.create_current_acc()

      current_acc
    end

    test "list_current_accs/0 returns all current_accs" do
      current_acc = current_acc_fixture()
      assert Deposits.list_current_accs() == [current_acc]
    end

    test "get_current_acc!/1 returns the current_acc with given id" do
      current_acc = current_acc_fixture()
      assert Deposits.get_current_acc!(current_acc.id) == current_acc
    end

    test "create_current_acc/1 with valid data creates a current_acc" do
      assert {:ok, %CurrentAcc{} = current_acc} = Deposits.create_current_acc(@valid_attrs)
      assert current_acc.accountNumber == "some accountNumber"
      assert current_acc.balance == 120.5
      assert current_acc.status == "some status"
    end

    test "create_current_acc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deposits.create_current_acc(@invalid_attrs)
    end

    test "update_current_acc/2 with valid data updates the current_acc" do
      current_acc = current_acc_fixture()
      assert {:ok, %CurrentAcc{} = current_acc} = Deposits.update_current_acc(current_acc, @update_attrs)
      assert current_acc.accountNumber == "some updated accountNumber"
      assert current_acc.balance == 456.7
      assert current_acc.status == "some updated status"
    end

    test "update_current_acc/2 with invalid data returns error changeset" do
      current_acc = current_acc_fixture()
      assert {:error, %Ecto.Changeset{}} = Deposits.update_current_acc(current_acc, @invalid_attrs)
      assert current_acc == Deposits.get_current_acc!(current_acc.id)
    end

    test "delete_current_acc/1 deletes the current_acc" do
      current_acc = current_acc_fixture()
      assert {:ok, %CurrentAcc{}} = Deposits.delete_current_acc(current_acc)
      assert_raise Ecto.NoResultsError, fn -> Deposits.get_current_acc!(current_acc.id) end
    end

    test "change_current_acc/1 returns a current_acc changeset" do
      current_acc = current_acc_fixture()
      assert %Ecto.Changeset{} = Deposits.change_current_acc(current_acc)
    end
  end
end
