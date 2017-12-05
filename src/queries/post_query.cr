class PostQuery < Post::BaseQuery
  def latest(page : Int = 1)
    limit = 5
    published_at.lte(Time.now).published_at.desc_order.limit(limit).offset(limit * (page - 1))
  end

  def find_published_by_slug(slug : String) : Post
    post = title.lower.is(titlelize(slug)).first? ||
      raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end

  private def titlelize(slug)
    slug.downcase.gsub("-", " ")
  end
end
