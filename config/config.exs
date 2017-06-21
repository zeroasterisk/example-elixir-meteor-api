# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :meteorappapi,
  ecto_repos: [Meteorappapi.Repo]

# Configures the endpoint
config :meteorappapi, Meteorappapi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lJwPMUk5hO/wXvmejEXqmXbpeGucPgu0YS9oliapJXgm7F3UWZDz3G3bY4cd44M8",
  render_errors: [view: Meteorappapi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meteorappapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
