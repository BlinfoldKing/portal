defmodule Portal.MixProject do
  use Mix.Project

  def project do
    [
      app: :portal,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Portal.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :poison, "~> 3.0" },
      { :plug, "~> 1.6" },
      { :cowboy, "~> 2.4" },
      { :plug_cowboy, "~> 2.0" },
      { :ecto_mnesia, "~> 0.9.1" }
    ]
  end
end
