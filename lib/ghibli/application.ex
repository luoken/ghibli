# defmodule Ghibli.Application do
#   # See https://hexdocs.pm/elixir/Application.html
#   # for more information on OTP Applications
#   @moduledoc false
#
#   use Application
#
#   @impl true
#   def start(_type, _args) do
#     children = [
#       GhibliWeb.Telemetry,
#       Ghibli.Repo,
#       {DNSCluster, query: Application.get_env(:ghibli, :dns_cluster_query) || :ignore},
#       {Phoenix.PubSub, name: Ghibli.PubSub},
#       # Start the Finch HTTP client for sending emails
#       {Finch, name: Ghibli.Finch},
#       # Start a worker by calling: Ghibli.Worker.start_link(arg)
#       # {Ghibli.Worker, arg},
#       # Start to serve requests, typically the last entry
#       GhibliWeb.Endpoint
#     ]
#
#     # See https://hexdocs.pm/elixir/Supervisor.html
#     # for other strategies and supported options
#     opts = [strategy: :one_for_one, name: Ghibli.Supervisor]
#     Supervisor.start_link(children, opts)
#   end
#
#   # Tell Phoenix to update the endpoint configuration
#   # whenever the application is updated.
#   @impl true
#   def config_change(changed, _new, removed) do
#     GhibliWeb.Endpoint.config_change(changed, removed)
#     :ok
#   end
# end
#
