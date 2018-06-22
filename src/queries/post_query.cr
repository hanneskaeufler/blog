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

  def published_search(term : String?)
    if term
      published.content.ilike("%#{term}%")
    else
      published
    end
  end

  def find_published_by_slug(slug : String) : Post
    published.slug(slug).first
  end
end
