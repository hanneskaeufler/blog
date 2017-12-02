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

      visitor.should contain "Sample post<a href=\"/posts/sample-post\">#</a>"
      visitor.should contain "Lorem ipsum<a href=\"/posts/lorem-ipsum\">#</a>"
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

  context "with a post titled 'welcome'" do
    describe "/posts/welcome" do
      it "renders a single post" do
        insert_post title: "Welcome", published_at: Time.now - 1.days

        visitor = AppVisitor.new

        visitor.visit("/posts/welcome")

        visitor.should contain "Welcome"
      end
    end
  end
end
