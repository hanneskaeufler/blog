require "spec"
require "../src/app"

Spec.before_each do
  PostQuery.new.destroy_all
end
