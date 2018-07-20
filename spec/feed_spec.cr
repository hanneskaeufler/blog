require "./spec_helper"

describe Blog::Feed do
  visitor = AppVisitor.new
  host = "http://0.0.0.0:5000"

  describe "/feed.json" do
    it "renders a valid json feed" do
      published = Time.epoch((2 * 24 * 60 * 60) + 60)
      updated = Time.epoch((3 * 24 * 60 * 60) + 50)
      insert_post title: "post title", content: "\n# post\ncontent", published_at: published, updated_at: updated
      post_id = PostQuery.new.first.id

      response = visitor.visit("/feed.json", headers)

      response.body.should eq({
        "version":       "https://jsonfeed.org/version/1",
        "title": "racing · software · open-source",
        "home_page_url": "#{host}/",
        "feed_url":      "#{host}/feed.json",
        "description":   Blog::Components::TAGLINE,
        "author":        {"name": "Hannes Käufler"},
        "favicon":       "#{host}/favicon.ico",
        "items":         [
          {
            "id":             "#{post_id}",
            "title":          "post title",
            "content_html":   "<h2>post</h2>\n\n<p>content</p>",
            "url":            "http://0.0.0.0:5000/posts/post-title",
            "date_published": "1970-01-03T00:01:00Z",
            "date_updated":   "1970-01-04T00:00:50Z",
          },
        ],
      }.to_json)
    end

    context "more than five posts" do
      it "adds a next_url link" do
        (PostQuery::PER_PAGE + 1).times { |i| insert_post title: i.to_s }

        response = visitor.visit("/feed.json", headers)

        JSON.parse(response.body)["next_url"].as_s.should eq "#{host}/feed.json?page=2"
      end

      it "does not show a next_url when on the last page" do
        (PostQuery::PER_PAGE + 1).times { |i| insert_post title: i.to_s }

        response = visitor.visit("/feed.json?page=2", headers)

        JSON.parse(response.body)["next_url"]?.should eq nil
      end
    end
  end
end

private def headers
  headers = HTTP::Headers.new
  headers.add("content-type", "application/json")
end
