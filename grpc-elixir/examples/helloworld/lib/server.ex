defmodule Helloworld.Greeter.Server do
  use GRPC.Server, service: Helloworld.Greeter.Service

  def say_hello(request, _stream) do
    IO.puts "Thanks for sending #{request.name}"
    Helloworld.HelloReply.new(message: "Hello #{request.name}")
  end
end
