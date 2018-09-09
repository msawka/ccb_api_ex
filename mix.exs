defmodule CcbApiEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ccb_api_ex,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :confex,
        :httpoison
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sweet_xml, "~> 0.6.5"},
      {:confex, "~> 3.3.1"},
      {:httpoison, "~> 1.2"},
      {:xml_builder, "~> 2.1.0"},
      {:uuid, "~> 1.1"}
    ]
  end
end
