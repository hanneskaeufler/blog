class Blog::Posts::ShowPage < MainLayout
  include Blog::Components

  needs post : Post

  def page_title_suffix
    " - #{@post.title}"
  end

  def content
    render_small_header
    render_post(@post)
    render_footer
  end

  private def render_post(post : Post)
    section class: "posts-container" do
      mount Blog::Posts::Components::FullPost.new(@post)
      div do
        link "« Back to all posts", to: Blog::Posts::Index.path
      end
    end
  end
end
