#!/usr/bin/env ruby

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'helloworld_services_pb'

def main
  stub = Helloworld::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
  user = ARGV.size > 0 ?  ARGV[0] : 'world'
  (1..100_000).each do |x|
    message = stub.say_hello(Helloworld::HelloRequest.new(name: x.to_s)).message
    #puts "#{Time.now.strftime("%Y/%m/%d %H:%M:%S")} Greeting: #{message} - #{x}"
  end
end

main
