class PostQuery < Post::BaseQuery
  def latest
    published_at.lt(Time.now).published_at.desc_order
  end
end
