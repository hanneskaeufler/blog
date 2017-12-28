ENV["LUCKY_ENV"] = "test"

require "spec"
require "./support/app_visitor"
require "./support/factories"
require "../src/app"

include AppVisitor::Matchers

# TODO: I think I can remove this because of https://github.com/luckyframework/lucky_record/commit/a2edad4f2177f94f00924ba212720d258b749cba
Spec.before_each do
  PostQuery.new.destroy_all
end

def empty_flash
  Lucky::Flash::Store.new
end

def build_post(content, published_at = Time.now)
  Post.new(1, Time.now, Time.now, "title", content, published_at, "title")
end

def context
  HTTP::Server::Context.new(HTTP::Request.new("GET", "/"), HTTP::Server::Response.new(IO::Memory.new))
end
