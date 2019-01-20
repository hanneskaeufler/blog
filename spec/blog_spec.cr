require "./spec_helper"

describe Blog do
  visitor = AppVisitor.new

  it "renders static assets" do
    visitor.visit("/assets/logos/xing.svg")

    visitor.should contain "simpleicons-xing-icon"
  end

  describe "/" do
    it "shows a title" do
      visitor.visit("/")

      visitor.should contain "<title>Hannes Käufler: Blog</title>"
    end

    it "shows posts" do
      insert_post title: "Sample post"
      insert_post title: "Lorem ipsum"

      visitor.visit("/")

      visitor.should contain "Sample post<a href=\"/posts/sample-post\"></a>"
      visitor.should contain "Lorem ipsum<a href=\"/posts/lorem-ipsum\"></a>"
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
      visitor.visit("/?page=-1")
      visitor.should redirect_to(Blog::Posts::Index.path(page: 1))
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
      it "publishes a new post" do
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
      <input type="text" id="post_title" name="post:title" value="some title">
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
        <input type="text" id="post_title" name="post:title" value="">
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
        visitor.should contain "<a href=\"/\">« Back to all posts</a>"
        visitor.should contain "Welcome</title>"
      end
    end
  end

  describe "/archive" do
    it "renders a search form" do
      visitor.visit("/archive")

      visitor.should contain "action=\"/search\""
      visitor.should contain "type=\"text\" value=\"\""
    end

    context "with a few posts" do
      it "shows published posts in chronological order" do
        reference = Time.utc(2015, 10, 10)
        insert_post title: "A Post", published_at: reference - 1.days
        insert_post title: "Another Post", published_at: reference - 2.days
        insert_post title: "Unpublished", published_at: Time.now + 1.days

        visitor.visit("/archive")

        visitor.should contain "<h2>Archive</h2>"
        visitor.should contain "<h3>#{reference.year}</h3>"
        visitor.should contain "A Post</a>"
        visitor.should contain "Another Post</a>"
        visitor.should_not contain "Unpublished"
      end

      context "with a search term" do
        it "only finds matching posts" do
          insert_post title: "Find me", content: "find me", published_at: Time.now - 1.days
          insert_post title: "Other", content: "mefind me as well", published_at: Time.now - 1.days
          insert_post title: "But not me", content: "not me", published_at: Time.now - 1.days

          body = {"q" => "find me"}
          visitor.post("/search", body)

          visitor.should contain "Find me</a>"
          visitor.should contain "Other</a>"
          visitor.should_not contain "But not me"
          visitor.should contain "value=\"find me\""
        end

        it "shows a message for no matches" do
          body = {"q" => "whatever since no posts"}
          visitor.post("/search", body)

          visitor.should contain "No posts found."
        end
      end
    end
  end
end
