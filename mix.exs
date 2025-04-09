defmodule Ghibli.MixProject do
  use Mix.Project

  def project do
    [
      app: :ghibli,
      version: "0.1.0",
      elixir: "~> 1.14",
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.2"}
    ]
  end

  defp package do
    [
      maintainers: ["Ken Luo"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/luoken/ghibli"}
    ]
  end
end
