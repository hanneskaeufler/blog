ENV["LUCKY_ENV"] = "test"

require "spec"
require "./support/app_visitor"
require "./support/factories"
require "../src/app"

include AppVisitor::Matchers

Spec.before_each do
  PostQuery.new.destroy_all
end

def empty_flash
  Lucky::Flash::Store.new
end

def build_post(content)
  Post.new(1, Time.now, Time.now, "title", content, Time.now)
end
