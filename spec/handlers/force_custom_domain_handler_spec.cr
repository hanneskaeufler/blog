require "../spec_helper"

describe ForceCustomDomainHandler do
  it "redirects to the custom domain when the heroku domain is requested" do
    req = request(host: "hannesdotkaeuflerdotnet.herokuapp.com")
    context = HTTP::Server::Context.new(req, response)

    middlewares.call context

    context.response.status_code.should eq 301
    context.response.headers["Location"].should eq Lucky::RouteHelper.settings.base_uri
  end

  it "simply calls the next handler when the custom domain is already used" do
    req = request(host: "https://hannes.kaeufler.net")
    context = HTTP::Server::Context.new(req, response)
    last = FakeHandler.new

    middlewares(last: last).call context

    last.was_called.should eq true
  end
end

class FakeHandler
  include HTTP::Handler
  @was_called = false
  getter was_called

  def call(context)
    @was_called = true
  end
end

def middlewares(last = FakeHandler.new)
  HTTP::Server.build_middleware([ForceCustomDomainHandler.new, last])
end

def response
  response = HTTP::Server::Response.new(IO::Memory.new)
end

def request(host : String)
  HTTP::Request.new("GET", "/", headers: HTTP::Headers{"host" => host})
end
