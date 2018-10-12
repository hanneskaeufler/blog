class FeedSerializer < Lucky::Serializer
  def initialize(@posts : Array(Post), @total_posts : Int64, @page : Int32)
  end

  def render
    feed = {
      version:       "https://jsonfeed.org/version/1",
      title:         "racing · software · open-source",
      home_page_url: Blog::Posts::Index.url,
      feed_url:      Blog::Feed.url,
      description:   Blog::Components::TAGLINE,
      author:        {name: "Hannes Käufler"},
      favicon:       "#{host}/favicon.ico",
      items:         items,
    }

    return feed.merge({ next_url: next_page_url }) if has_next_page

    feed
  end

  private def next_page_url
    Blog::Feed.with(@page + 1).url
  end

  private def items
    @posts.map { |post| PostSerializer.new(post).render }
  end

  private def has_next_page
    not_last_page = @page * PostQuery::PER_PAGE < @total_posts
    more_than_one_page = @total_posts > PostQuery::PER_PAGE
    more_than_one_page && not_last_page
  end

  private def host
    Lucky::RouteHelper.settings.base_uri
  end
end
