class PostSerializer < Lucky::Serializer
  def initialize(@post : Post)
  end

  def render
    {
      id:             "#{@post.id}",
      title:          @post.title,
      content_html:   PostContentRenderer.new.render(@post),
      url:            Blog::Posts::Show.with(@post.slug).url,
      date_published: @post.published_at.to_rfc3339,
      date_updated:   @post.updated_at.to_rfc3339,
    }
  end
end
