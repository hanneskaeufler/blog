class Blog::Feed < BrowserAction
  get "/feed.json" do
    json({
      "version": "https://jsonfeed.org/version/1",
      "home_page_url": "http://hannes.kaeufler.net",
      "feed_url": "http://hannes.kaeufler.net/feed.json",
      "items": items
    })
  end

  private def items
    PostQuery.new.latest.map do |post|
      {
        "id": "#{post.id}",
        "title": post.title,
        "content_html": post.content,
        "url": Blog::Posts::Show.path(post.slug),
        "date_published": Time::Format::ISO_8601_DATE_TIME.format(post.published_at),
        "date_modified": Time::Format::ISO_8601_DATE_TIME.format(post.updated_at)
      }
    end
  end
end
