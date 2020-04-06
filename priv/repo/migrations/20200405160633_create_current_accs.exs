defmodule Phbank.Repo.Migrations.CreateCurrentAccs do
  use Ecto.Migration

  def change do
    create table(:current_accs) do
      add :accountNumber, :string
      add :balance, :float
      add :status, :string

      timestamps()
    end

  end
end
