defmodule Clp.Repo do
  use Ecto.Repo,
    otp_app: :clp,
    adapter: Ecto.Adapters.Postgres
end
