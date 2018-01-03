require "./spec_helper"

describe Blog do
  it "renders a generic not found page for unhandled routes" do
    visitor = AppVisitor.new

    visitor.visit("/surelynonexistent")

    visitor.should contain "<h1>Not Found</h1>"
    visitor.response.status_code.should eq 404
  end
end
