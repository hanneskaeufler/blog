class PublishedPost
  def initialize(@post : Post)
  end

  def id
    @post.id
  end

  def created_at
    @post.created_at
  end

  def updated_at
    @post.updated_at
  end

  def title : String
    @post.title
  end

  def content : String
    @post.content
  end

  def published_at : Time
    @post.published_at || Time.now
  end

  def slug : String
    @post.slug
  end

  def post
    @post
  end
end
