use Mix.Config

config :lager, handlers: [
  lager_console_backend: :warn
]

config :watchman,
  host: "metrics.semaphoreci.com",
  port: 8125,
  prefix: "grpc-elixir.test"
