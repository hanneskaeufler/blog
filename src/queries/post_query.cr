class PostQuery < Post::BaseQuery
  def latest
    published_at.lt(Time.now).published_at.desc_order
  end

  def find_published_by_slug(slug : String) : Post
    post = title.lower.is(slug.downcase).first? ||
      raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end
end
