defmodule Shad.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {NodeJS.Supervisor, [path: LiveSvelte.SSR.NodeJS.server_path(), pool_size: 4]},
      ShadWeb.Telemetry,
      Shad.Repo,
      {DNSCluster, query: Application.get_env(:shad, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Shad.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Shad.Finch},
      # Start a worker by calling: Shad.Worker.start_link(arg)
      # {Shad.Worker, arg},
      # Start to serve requests, typically the last entry
      ShadWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Shad.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShadWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
