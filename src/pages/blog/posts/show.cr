class Blog::Posts::ShowPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  needs post : Post

  def page_title_suffix
    " - #{@post.title}"
  end

  def inner
    render_header
    render_post(@post)
    render_footer
  end

  private def render_header
    header class: "blog-title-small" do
      section do
        div do
          link "« All posts", to: Blog::Posts::Index.path
        end
        render_tagline
      end
    end
  end

  private def render_post(post : Post)
    section class: "posts-container" do
      single_post(@post)
    end
  end
end
