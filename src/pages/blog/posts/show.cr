class Blog::Posts::ShowPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  needs post : Post

  def page_title_suffix
    " - #{@post.title}"
  end

  def inner
    render_small_header
    render_post(@post)
    render_footer
  end

  private def render_post(post : Post)
    section class: "posts-container" do
      single_post(@post)
      div do
        link "« Back to all posts", to: Blog::Posts::Index.path
      end
    end
  end
end
