require "./app"
require "./middlewares"

host = Lucky::Server.settings.host
port = Lucky::Server.settings.port

server = HTTP::Server.new(Blog.middlewares)

puts "Listening on http://#{host}:#{port}"

Signal::INT.trap do
  server.close
end

server.bind_tcp host, port
server.listen
