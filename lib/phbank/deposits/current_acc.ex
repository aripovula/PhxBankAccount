defmodule Phbank.Deposits.CurrentAcc do
  use Ecto.Schema
  import Ecto.Changeset

  schema "current_accs" do
    field :accountNumber, :string
    field :balance, :float
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(current_acc, attrs) do
    current_acc
    |> cast(attrs, [:accountNumber, :balance, :status])
    |> validate_required([:accountNumber, :balance, :status])
  end

@doc """
  Returns new balance.

  ## Examples

      iex> countBalance("10", "4", "0")
      14

  """
  def countBalance(balance, deposit, withdrawal) do

    {balance, _} = case balance do
      "" -> {0, ""}
      _ -> Float.parse(balance)
    end

    {deposit, _} = case deposit do
      "" -> {0, ""}
      _ -> Float.parse(deposit)
    end

    {withdrawal, _} = case withdrawal do
      "" -> {0, ""}
      _ -> Float.parse(withdrawal)
    end

    balance + deposit - withdrawal
  end
end
