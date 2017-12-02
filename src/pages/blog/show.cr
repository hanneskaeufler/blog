class Blog::ShowPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  needs post : Post

  def inner
    section class: "posts-container" do
      single_post(@post)
    end

    render_footer
  end
end
