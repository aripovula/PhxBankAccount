defmodule Phbank.Repo do
  use Ecto.Repo,
    otp_app: :phbank,
    adapter: Ecto.Adapters.Postgres
end
