use Mix.Config

# Configure your database
config :fare, Fare.Repo,
  # username: "postgres",
  # password: "postgres",
  username: "btihen",
  database: "fare_pow_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :fare, FareWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :fare, FareWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/fare_web/(live|views)/.*(ex)$",
      ~r"lib/fare_web/templates/.*(eex)$"
    ]
  ]

# # config email sending
# # With Bamboo.Localhost - also config routes with:
# # if Mix.env == :dev do
# #   forward "/sent_emails", Bamboo.EmailPreviewPlug
# # end
config :fare, FareWeb.Pow.Mailer,
  adapter: Bamboo.LocalAdapter

# # with Bamboo SMTP & mailhog - similar to dev env
# # - you can send emails to `localhost:1025`
# # and read sent emails at: `http:localhost:8025`
# http://localhost:8025
# # https://mailcatcher.me/ or https://github.com/mailhog/MailHog
# # all adapters are listed here: https://hexdocs.pm/bamboo/readme.html#available-adapters
# config :fare, FareWeb.Pow.Mailer,
#   adapter: Bamboo.SMTPAdapter,
#   server: "localhost",
#   port: 1025

# best when configured in config/production.secret.exs or config/development.secret.exx
# config :fare, :pow_assent,
#   providers: [
#     github: [
#       client_id: Application.get_env(:fare, :github_client_id),
#       client_secret: Application.get_env(:fare, :github_client_secret),
#       strategy: Assent.Strategy.Github
#     ]
#   ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# github oauth is configured here:
import_config "dev.secret.exs"
