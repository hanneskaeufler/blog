class PublishedPost
  def initialize(@post : Post)
  end

  delegate id, created_at, updated_at, title, content, published_at, slug, to: @post

  def published_at : Time
    @post.published_at || Time.now
  end
end
