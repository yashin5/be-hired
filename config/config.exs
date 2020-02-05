# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :be_hired,
  ecto_repos: [BeHired.Repo]

config :be_hired_web,
  ecto_repos: [BeHired.Repo],
  generators: [context_app: :be_hired]

config :be_hired, BeHired.Repo,
  database: System.get_env("DB_NAME") || "jobs_repository_dev",
  username: System.get_env("DB_USER") || "ysantos",
  password: System.get_env("DB_PASSWORD") || "@dmin123",
  hostname: System.get_env("DB_HOST") || "localhost"

# Configures the endpoint
config :be_hired_web, BeHiredWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Hoi8TRLfJ2Rba2RxhcUaq2LbNploWHSyJSxrfIQvXphQZB+xKfJw/BMl3ElCpbbW",
  render_errors: [view: BeHiredWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BeHiredWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
