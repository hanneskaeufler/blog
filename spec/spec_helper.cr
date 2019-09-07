ENV["LUCKY_ENV"] = "test"

require "spec"
require "./support/app_visitor"
require "./support/factories"
require "../src/app"

include AppVisitor::Matchers

Spec.before_each do
  PostQuery.truncate
end

def empty_flash
  Lucky::Flash::Store.new
end

def build_post(content, published_at = Time.local)
  Post.new(UUID.random.to_s, Time.local, Time.local, "title", content, published_at, "title")
end

def context
  con = HTTP::Server::Context.new(HTTP::Request.new("GET", "/"), HTTP::Server::Response.new(IO::Memory.new))
  con.session.set(Lucky::ProtectFromForgery::SESSION_KEY, "statictoken")
  con
end
