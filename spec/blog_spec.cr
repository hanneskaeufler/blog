require "./spec_helper"

describe Blog do
  visitor = AppVisitor.new

  describe "/" do
    it "shows a title" do
      visitor.visit("/")

      visitor.should contain "<title>Hannes Käufler: Blog</title>"
    end

    it "shows posts" do
      insert_post title: "Sample post"
      insert_post title: "Lorem ipsum"

      visitor.visit("/")

      visitor.should contain "Sample post<a href=\"/posts/sample-post\">#</a>"
      visitor.should contain "Lorem ipsum<a href=\"/posts/lorem-ipsum\">#</a>"
    end

    it "shows the second page of posts" do
      (1..7).each do |index|
        insert_post title: "title #{index}", published_at: Time.now - index.days
      end

      visitor.visit("/?page=2")

      visitor.should contain "title 6"
      visitor.should contain "title 7"
    end

    it "redirects to root for invalid pages" do
      visitor.visit("/?page=0")
      visitor.should redirect_to(Blog::Posts::Index.path(page: 1))
    end
  end

  describe "/posts/new" do
    it "shows an editor and a button" do
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
        data = {
          "post:title"   => "",
          "post:content" => "",
        }

        visitor.post("/posts/create", data)

        visitor.should contain "Title is required"
        visitor.should contain "Content is required"
      end
    end

    context "all fields filled" do
      it "pusblishes a new post" do
        data = {
          "post:title"   => "some title",
          "post:content" => "some content",
        }

        visitor.post("/posts/create", data)

        visitor.should redirect_to("/")
        PostQuery.new.latest.results.size.should eq 1
      end
    end

    context "post with same title exists" do
      it "shows an error" do
        insert_post(title: "some title")

        data = {
          "post:title"   => "some title",
          "post:content" => "some content",
        }

        visitor.post("/posts/create", data)

        PostQuery.new.latest.results.size.should eq 1
        visitor.should contain "Title already exists"
      end
    end

    context "post with same slug exists" do
      it "shows an error" do
        insert_post(title: "some-title")

        data = {
          "post:title"   => "some title",
          "post:content" => "some content",
        }

        visitor.post("/posts/create", data)

        PostQuery.new.latest.results.size.should eq 1
        visitor.should contain "Title already exists"
      end
    end
  end

  describe "/posts/:id/edit" do
    it "renders the form" do
      insert_post(title: "some title")
      post = PostQuery.new.first

      visitor.visit("/posts/#{post.id}/edit")

      visitor.should contain "Edit post"
      visitor.should contain "action=\"/posts/#{post.id}/update\""
      visitor.should contain <<-HTML
      <input type="text" id="post_title" name="post:title" value="some title"/>
      HTML
    end
  end

  describe "/posts/:id/update" do
    context "fields correctly" do
      it "redirects and saves" do
        insert_post(title: "some title")

        data = {
          "post:title"   => "some title",
          "post:content" => "some updated content",
        }
        post = PostQuery.new.first
        visitor.put("/posts/#{post.id}/update", data)

        visitor.should redirect_to Blog::Posts::Index.path
      end
    end

    context "fields filled incorrectly" do
      it "renders the form" do
        insert_post(title: "some title")

        data = {
          "post:title"   => "",
          "post:content" => "some content",
        }
        post = PostQuery.new.first
        visitor.put("/posts/#{post.id}/update", data)

        visitor.should contain "Edit post"
        visitor.should contain "action=\"/posts/#{post.id}/update\""
        visitor.should contain <<-HTML
        <input type="text" id="post_title" name="post:title" value=""/>
        HTML
      end
    end
  end

  context "with a post titled 'welcome'" do
    describe "/posts/welcome" do
      it "renders a single post" do
        insert_post title: "Welcome", published_at: Time.now - 1.days

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
      published = Time.epoch((2 * 24 * 60 * 60) + 60)
      updated = Time.epoch((3 * 24 * 60 * 60) + 50)
      insert_post title: "post title", content: "\n# post\ncontent", published_at: published, updated_at: updated
      post_id = PostQuery.new.first.id

      response = visitor.visit("/feed.json", headers)

      response.body.should eq({
        "version":       "https://jsonfeed.org/version/1",
        "home_page_url": "http://hannesdotkaeuflerdotnet.herokuapp.com/",
        "feed_url":      "http://hannesdotkaeuflerdotnet.herokuapp.com/feed.json",
        "items":         [
          {
            "id":             "#{post_id}",
            "title":          "post title",
            "content_html":   "<h2>post</h2>\n\n<p>content</p>",
            "url":            "http://hannesdotkaeuflerdotnet.herokuapp.com/posts/post-title",
            "date_published": "1970-01-03T00:01:00+0000",
            "date_updated":   "1970-01-04T00:00:50+0000",
          },
        ],
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
