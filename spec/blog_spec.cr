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
      it "pusblishes a new post" do
        visitor = AppVisitor.new
        data = {
          "post:title" => "some title",
          "post:content" => "some content"
        }

        visitor.post("/posts/create", data)

        visitor.should redirect_to("/")
        PostQuery.new.latest.results.size.should eq 1
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

  describe "/feed.json" do
    it "renders a valid json feed" do
      headers = HTTP::Headers.new
      headers.add("content-type", "application/json")
      visitor = AppVisitor.new
      published = Time.now - 2.days
      updated = Time.now - 1.day
      insert_post title: "post title", content: "\n# post\ncontent", published_at: published, updated_at: updated
      post_id = PostQuery.new.first.id

      response = visitor.visit("/feed.json", headers)

      response.body.should eq({
        "version": "https://jsonfeed.org/version/1",
        "home_page_url": "http://hannes.kaeufler.net",
        "feed_url": "http://hannes.kaeufler.net/feed.json",
        "items": [
          {
            "id": "#{post_id}",
            "title": "post title",
            "content_html": "<h2>post</h2>\n\n<p>content</p>",
            "url": "/posts/post-title"
          }
        ]
      }.to_json)
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
