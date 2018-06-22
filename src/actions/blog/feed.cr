class Blog::Feed < ApiAction
  @renderer = PostContentRenderer.new

  param page : Int32 = 1

  get "/feed.json" do
    feed = {
      "version"       => "https://jsonfeed.org/version/1",
      "home_page_url" => Blog::Posts::Index.url,
      "feed_url"      => Blog::Feed.url,
      "description"   => Blog::Components::TAGLINE,
      "author"        => {"name" => "Hannes Käufler"},
      "favicon"       => "#{host}/favicon.ico",
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
      "date_published": post.published_at.to_rfc3339,
      "date_updated":   post.updated_at.to_rfc3339,
    }
  end

  private def has_next_page
    posts_count = PostQuery.new.published.count.to_i
    not_last_page = page * PostQuery::PER_PAGE < posts_count
    more_than_one_page = posts_count > PostQuery::PER_PAGE
    more_than_one_page && not_last_page
  end

  private def host
    Lucky::RouteHelper.settings.base_uri
  end
end
