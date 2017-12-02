require "./spec_helper"

describe Blog do
  describe "/" do
    it "shows a title" do
      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "<h1>Hannes Käufler</h1>"
    end

    it "shows posts" do
      insert_post title: "Sample post"
      insert_post title: "Lorem ipsum"

      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "Sample post"
      visitor.should contain "Lorem ipsum"
    end
  end
end
