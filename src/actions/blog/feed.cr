class Blog::Feed < ApiAction
  @renderer = PostContentRenderer.new

  param page : Int32 = 1

  get "/feed.json" do
    feed = {
      "version"       => "https://jsonfeed.org/version/1",
      "home_page_url" => Blog::Posts::Index.url,
      "feed_url"      => Blog::Feed.url,
      "description"   => Blog::Components::TAGLINE,
      "items"         => items,
    }

    if has_next_page
      feed["next_url"] = Blog::Feed.with(page + 1).url
    end

    json(feed)
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

  private def has_next_page
    posts_count = PostQuery.new.published.count.to_i
    not_last_page = page * PostQuery::PER_PAGE < posts_count
    posts_count > PostQuery::PER_PAGE && not_last_page
  end
end
