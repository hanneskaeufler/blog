require "http/client"

class AppVisitor
  getter! response
  @response : HTTP::Client::Response? = nil

  def visit(path)
    request = HTTP::Request.new("GET", path)
    @response = process_request(request)
  end

  def process_request(request)
    io = IO::Memory.new
    response = HTTP::Server::Response.new(io)
    context = HTTP::Server::Context.new(request, response)
    middlewares.call context
    response.close
    io.rewind
    HTTP::Client::Response.from_io(io, decompress: false)
  end

  def middlewares
    HTTP::Server.build_middleware([
      Lucky::HttpMethodOverrideHandler.new,
      Lucky::SessionHandler.new,
      Lucky::Flash::Handler.new,
      Lucky::ErrorHandler.new(action: Errors::Show),
      Lucky::RouteHandler.new,
      Lucky::StaticFileHandler.new("./public", false),
    ])
  end

  module Matchers
    def contain(expected)
      Spec::ContainExpectation.new(expected)
    end
  end

  def includes?(expected_value)
    response.body.includes? expected_value
  end
end
