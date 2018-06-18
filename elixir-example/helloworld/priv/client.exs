{:ok, channel} = GRPC.Stub.connect("localhost:50051")
# {:ok, channel} = GRPC.Stub.connect("localhost:50051", adapter: GRPC.Adapter.Gun)
IO.inspect(Time.utc_now())

Enum.each(1..100_000, fn x ->
  # IO.puts x
  {:ok, reply} =
    channel
    |> Helloworld.Greeter.Stub.say_hello(Helloworld.HelloRequest.new(name: Integer.to_string(x)))

  # IO.inspect reply
end)

IO.inspect(Time.utc_now())