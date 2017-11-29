require "markdown"

class Blog::IndexPage < MainLayout
  needs posts : Array(Post)

  def inner
    @posts.each do |post|
      h2 post.title
      span post.published_at.to_s
      raw Markdown.to_html(post.content)
    end
  end
end
