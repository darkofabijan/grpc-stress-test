{:ok, channel} = GRPC.Stub.connect("localhost:50051")
Enum.each 1..100_000, fn(x) ->
  # IO.puts x
  reply = channel |> Helloworld.Greeter.Stub.say_hello(Helloworld.HelloRequest.new(name: Integer.to_string(x)))
  IO.inspect reply
end

