defmodule Helloworld.Mixfile do
  use Mix.Project

  def project do
    [
      app: :helloworld,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: true,
      start_permanent: true,
      deps: deps()
    ]
  end

  def application do
    [mod: {HelloworldApp, []}, extra_applications: [:logger]]
  end

  defp deps do
    [
      {:grpc, github: "tony612/grpc-elixir"},
      {:protobuf, github: "tony612/protobuf-elixir", override: true},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false}
    ]
  end
end
