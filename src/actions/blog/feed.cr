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
        "url": Blog::Posts::Show.path(post.slug)
      }
    end
  end
end
