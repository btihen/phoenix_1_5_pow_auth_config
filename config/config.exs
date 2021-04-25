# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fare,
  ecto_repos: [Fare.Repo]

# Configures the endpoint
config :fare, FareWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VaYkryl4VXr72D/LuP4tFQQeBr/8JuVEWjitqQ0c6krbqNl3AjkZ+PvK7BtEdQNm",
  render_errors: [view: FareWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Fare.PubSub,
  live_view: [signing_salt: "aEoWxk40"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# config for pow - user authentication
config :fare, :pow,
  user: Fare.Users.User,
  repo: Fare.Repo,
  web_module: FareWeb,
  web_mailer_module: FareWeb,
  mailer_backend: FareWeb.Pow.Mailer,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
