class PostQuery < Post::BaseQuery
  PER_PAGE = 5
  def latest(page : Int = 1)
    published_at.lte(Time.now)
      .published_at.desc_order
      .limit(PER_PAGE)
      .offset(PER_PAGE * (page - 1))
  end

  def published
    published_at.lte(Time.now)
  end

  def find_published_by_slug(slug : String) : Post
    post = title.lower.is(titlelize(slug)).first? ||
      raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end

  private def titlelize(slug)
    slug.downcase.gsub("-", " ")
  end
end
