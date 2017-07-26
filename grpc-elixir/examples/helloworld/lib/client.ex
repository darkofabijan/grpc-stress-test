defmodule Helloworld.ClientWorker do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    {:ok, ch} = GRPC.Stub.connect("localhost:50051")
    async_send(100)
    {:ok, ch}
  end

  def async_send(seconds \\ 0) do
    Process.send_after(self(), :request, seconds)
  end

  def handle_info(:request, ch) do
    Enum.each 1..100_000, fn(x) ->
      reply = ch |> Helloworld.Greeter.Stub.say_hello(Helloworld.HelloRequest.new(name: Integer.to_string(x)))
      if rem(x, 1000) == 0 do
        IO.puts "#{Time.utc_now} #{x}"
        IO.inspect reply
      end
    end
    {:noreply, ch}
  end
end
