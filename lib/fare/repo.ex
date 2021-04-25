defmodule Fare.Repo do
  use Ecto.Repo,
    otp_app: :fare,
    adapter: Ecto.Adapters.Postgres
end
