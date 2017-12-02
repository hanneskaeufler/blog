require "./spec_helper"

describe Blog do
  describe "/" do
    it "shows a title" do
      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "<title>Hannes Käufler: Blog</title>"
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

  describe "/admin" do
    it "shows an editor" do
      visitor = AppVisitor.new

      visitor.visit("/admin")

      visitor.should contain "<h1>New post</h1>"
      visitor.should contain "textarea"
    end
  end
end
