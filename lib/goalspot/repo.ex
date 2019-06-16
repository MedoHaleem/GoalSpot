defmodule Goalspot.Repo do
  use Ecto.Repo,
    otp_app: :goalspot,
    adapter: Ecto.Adapters.Postgres
end
