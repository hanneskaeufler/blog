require "./spec_helper"

describe Blog::Feed do
  visitor = AppVisitor.new

  describe "/feed.json" do
    it "renders a valid json feed" do
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
end

private def headers
  headers = HTTP::Headers.new
  headers.add("content-type", "application/json")
end
