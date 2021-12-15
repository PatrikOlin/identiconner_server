defmodule IdenticonnerServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: IdenticonnerServer,
        options: [port: 4000]
      )
      # Starts a worker by calling: IdenticonnerServer.Worker.start_link(arg)
      # {IdenticonnerServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IdenticonnerServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
