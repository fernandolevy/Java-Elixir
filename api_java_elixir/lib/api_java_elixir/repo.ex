defmodule ApiJavaElixir.Repo do
  use Ecto.Repo,
    otp_app: :api_java_elixir,
    adapter: Ecto.Adapters.Postgres
end
