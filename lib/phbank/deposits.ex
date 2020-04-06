defmodule Phbank.Deposits do
  @moduledoc """
  The Deposits context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias Phbank.Repo

  alias Phbank.Deposits.CurrentAcc

  @doc """
  Returns the list of current_accs.

  ## Examples

      iex> list_current_accs()
      [%CurrentAcc{}, ...]

  """
  def list_current_accs do
    Repo.all(CurrentAcc)
  end

  @doc """
  Gets a single current_acc.

  Raises `Ecto.NoResultsError` if the Current acc does not exist.

  ## Examples

      iex> get_current_acc!(123)
      %CurrentAcc{}

      iex> get_current_acc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_current_acc!(id), do: Repo.get!(CurrentAcc, id)

  @doc """
  Gets a single current_acc.

  Raises `Ecto.NoResultsError` if the Current acc does not exist.

  ## Examples

      iex> get_current_acc!(123)
      %CurrentAcc{}

      iex> get_current_acc!(456)
      ** (Ecto.NoResultsError)

  """
  def update_balance!(id, balance), do:
  Repo.get!(CurrentAcc, id)
  |> change(%{balance: balance})
  |> Repo.update()

  @doc """
  Creates a current_acc.

  ## Examples

      iex> create_current_acc(%{field: value})
      {:ok, %CurrentAcc{}}

      iex> create_current_acc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_current_acc(attrs \\ %{}) do
    %CurrentAcc{}
    |> CurrentAcc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a current_acc.

  ## Examples

      iex> update_current_acc(current_acc, %{field: new_value})
      {:ok, %CurrentAcc{}}

      iex> update_current_acc(current_acc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_current_acc(%CurrentAcc{} = current_acc, attrs) do
    current_acc
    |> CurrentAcc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a current_acc.

  ## Examples

      iex> delete_current_acc(current_acc)
      {:ok, %CurrentAcc{}}

      iex> delete_current_acc(current_acc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_current_acc(%CurrentAcc{} = current_acc) do
    Repo.delete(current_acc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking current_acc changes.

  ## Examples

      iex> change_current_acc(current_acc)
      %Ecto.Changeset{source: %CurrentAcc{}}

  """
  def change_current_acc(%CurrentAcc{} = current_acc) do
    CurrentAcc.changeset(current_acc, %{})
  end
end
