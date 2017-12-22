class Blog::Feed < ApiAction
  @renderer = PostContentRenderer.new

  get "/feed.json" do
    json({
      "version":       "https://jsonfeed.org/version/1",
      "home_page_url": Blog::Posts::Index.url,
      "feed_url":      Blog::Feed.url,
      "items":         items,
    })
  end

  private def items
    PostQuery.new.latest.map { |post| post_json(post) }
  end

  private def post_json(post : Post)
    {
      "id":             "#{post.id}",
      "title":          post.title,
      "content_html":   @renderer.render(post),
      "url":            Blog::Posts::Show.with(post.slug).url,
      "date_published": Time::Format::ISO_8601_DATE_TIME.format(post.published_at),
      "date_updated":   Time::Format::ISO_8601_DATE_TIME.format(post.updated_at),
    }
  end
end
