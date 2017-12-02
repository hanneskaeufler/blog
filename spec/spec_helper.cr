require "spec"
require "./support/app_visitor"
require "./support/factories"
require "../src/app"

Spec.before_each do
  PostQuery.new.destroy_all
end
