require "./spec_helper"

describe Blog do
  it "renders a generic not found page for unhandled routes" do
    Lucky::ErrorHandler.configure { |settings| settings.show_debug_output = false }
    visitor = AppVisitor.new

    visitor.visit("/surelynonexistent")

    visitor.should contain "Sorry"
    visitor.response.status_code.should eq 404
    visitor.response.headers["Content-Type"].should eq "text/html"
  end

  it "renders a not found page for invalid posts" do
    Lucky::ErrorHandler.configure { |settings| settings.show_debug_output = false }
    visitor = AppVisitor.new

    visitor.visit("/posts/not-there")

    visitor.should contain "<h1>Not Found</h1>"
    visitor.response.status_code.should eq 404
  end
end
