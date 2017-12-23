# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web_hello,
  ecto_repos: [WebHello.Repo]

# Configures the endpoint
config :web_hello, WebHelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SYdhPE7W/ox6ZMqyyEI3rhRSJuc9YRgu+togtWmYrqvuG3P0Bf3IqHJ8AXHuLQHF",
  render_errors: [view: WebHelloWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WebHello.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
