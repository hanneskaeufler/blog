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

  describe "/posts/new" do
    it "shows an editor and a button" do
      visitor = AppVisitor.new

      visitor.visit("/posts/new")

      visitor.should contain "<h1>New post</h1>"
      visitor.should contain "input type=\"text\""
      visitor.should contain "textarea"
      visitor.should contain "input type=\"submit\""
    end
  end

  describe "/posts/create" do
    context "none of the fields filled" do
      it "rerenders the form with errors" do
        visitor = AppVisitor.new
        data = {
          "post:title" => "",
          "post:content" => ""
        }

        visitor.post("/posts/create", data)

        visitor.should contain "Title is required"
        visitor.should contain "Content is required"
      end
    end

    context "all fields filled" do
      it "creates a post" do
        visitor = AppVisitor.new
        data = {
          "post:title" => "some title",
          "post:content" => "some content"
        }

        visitor.post("/posts/create", data)

        visitor.should contain "Created!"
        PostQuery.new.count.should eq 1
      end
    end
  end

  context "with a post titled 'welcome'" do
    describe "/posts/welcome" do
      it "renders a single post" do
        insert_post title: "Welcome", published_at: Time.now - 1.days

        visitor = AppVisitor.new

        visitor.visit("/posts/welcome")

        visitor.should contain "<h2>Welcome"
        visitor.should contain "<a href=\"/\">« All posts</a>"
        visitor.should contain "Welcome</title>"
      end
    end
  end

  # context "with no posts" do
  #   it "renders a generic not found error" do
  #       visitor = AppVisitor.new

  #       visitor.visit("/posts/welcome")

  #       visitor.should contain "<h1>Not found</h1>"
  #   end
  # end
end
