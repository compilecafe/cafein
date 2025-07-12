defmodule Cafein.Repo do
  use Ecto.Repo,
    otp_app: :cafein,
    adapter: Ecto.Adapters.Postgres
end
