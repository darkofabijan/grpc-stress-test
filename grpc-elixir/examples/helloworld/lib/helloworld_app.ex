defmodule HelloworldApp do
  use Application

  def start(_type, []) do
    import Supervisor.Spec
    app_type = System.get_env("APP_TYPE")
    if app_type == "client" do
      children = [
        worker(Helloworld.ClientWorker, [])
      ]

      opts = [strategy: :one_for_one, name: HelloworldClient]
      Supervisor.start_link(children, opts)
    else
      children = [
        supervisor(GRPC.Server.Supervisor, [{Helloworld.Greeter.Server, 50051}])
      ]

      opts = [strategy: :one_for_one, name: HelloworldApp]
      Supervisor.start_link(children, opts)
    end
  end
end
