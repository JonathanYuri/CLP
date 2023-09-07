defmodule Clp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ClpWeb.Telemetry,
      # Start the Ecto repository
      Clp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Clp.PubSub},
      # Start Finch
      {Finch, name: Clp.Finch},
      # Start the Endpoint (http/https)
      ClpWeb.Endpoint
      # Start a worker by calling: Clp.Worker.start_link(arg)
      # {Clp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Clp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
