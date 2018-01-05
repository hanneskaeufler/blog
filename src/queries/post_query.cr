class PostQuery < Post::BaseQuery
  PER_PAGE = 5

  def latest(page : Int = 1)
    published_at.lte(Time.now)
                .published_at.desc_order
                             .limit(PER_PAGE)
                             .offset(PER_PAGE * (page - 1))
  end

  def published
    published_at.lte(Time.now).published_at.desc_order
  end

  def find_published_by_slug(slug : String) : Post
    post = published.slug(slug).first? ||
           raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end
end
