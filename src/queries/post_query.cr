class PostQuery < Post::BaseQuery
  def latest
    published_at.lte(Time.now).published_at.desc_order.limit(5)
  end

  def find_published_by_slug(slug : String) : Post
    post = title.lower.is(titlelize(slug)).first? ||
      raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end

  private def titlelize(slug)
    slug.downcase.gsub("-", " ")
  end
end
