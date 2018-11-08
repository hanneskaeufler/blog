require "./spec_helper"

describe Blog do
  it "renders a generic not found page for unhandled routes" do
    visitor = AppVisitor.new

    visitor.visit("/surelynonexistent")

    visitor.should contain "<h1>Not Found</h1>"
    visitor.response.status_code.should eq 404
  end

  it "renders a not found page for invalid posts" do
    Lucky::ErrorHandler.configure { |settings| settings.show_debug_output = false }
    visitor = AppVisitor.new

    visitor.visit("/posts/not-there")

    visitor.should contain "<h1>Not Found</h1>"
    visitor.response.status_code.should eq 404
  end
end
