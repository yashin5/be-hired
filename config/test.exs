use Mix.Config

# Configure your database
config :be_hired, BeHired.Repo,
  database: System.get_env("DB_NAME") || "jobs_repository_dev",
  username: System.get_env("DB_USER") || "ysantos",
  password: System.get_env("DB_PASSWORD") || "@dmin123",
  hostname: System.get_env("DB_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :be_hired_web, BeHiredWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
