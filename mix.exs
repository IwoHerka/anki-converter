defmodule AnkiConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :anki_converter,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:csv, "~> 3.0"},
      {:earmark, "~> 1.4"},
      {:panpipe, "~> 0.2"}
    ]
  end
end
