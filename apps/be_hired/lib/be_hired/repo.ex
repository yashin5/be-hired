defmodule BeHired.Repo do
  use Ecto.Repo,
    otp_app: :be_hired,
    adapter: Ecto.Adapters.Postgres
end
