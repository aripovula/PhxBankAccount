# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phbank,
  ecto_repos: [Phbank.Repo]

# Configures the endpoint
config :phbank, PhbankWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hkhfZ4djayeJbawCzAfojB2B9b1BQt9APagzJw2ogqClgWdLPqX1oVG4hQKuqarZ",
  render_errors: [view: PhbankWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phbank.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "cjZYfC9dWM7B2YejaRTDmdywx9zI+Ibr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
