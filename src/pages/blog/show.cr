class Blog::ShowPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  needs post : Post

  def inner
    render_post(@post)
    render_footer
  end

  private def render_post(post : Post)
    section class: "posts-container" do
      single_post(@post)
    end
  end
end
