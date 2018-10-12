class PostSerializer < Lucky::Serializer
  @renderer = PostContentRenderer.new

  def initialize(@post : Post)
  end

  def render
    {
      id:             "#{@post.id}",
      title:          @post.title,
      content_html:   @renderer.render(@post),
      url:            Blog::Posts::Show.with(@post.slug).url,
      date_published: @post.published_at.to_rfc3339,
      date_updated:   @post.updated_at.to_rfc3339,
    }
  end
end
