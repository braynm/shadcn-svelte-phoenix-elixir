defmodule Shad.Repo do
  use Ecto.Repo,
    otp_app: :shad,
    adapter: Ecto.Adapters.Postgres
end
