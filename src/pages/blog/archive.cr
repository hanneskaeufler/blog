class Blog::ArchivePage < MainLayout
  include Blog::Components

  needs posts : Array(Post)

  def inner
    render_small_header
    render_post_titles(@posts)
    render_footer
  end

  private def render_post_titles(posts)
    section class: "posts-archive" do
      h2 "Archive"
      ul do
        @posts.each do |post|
          li do
            span post.published_at.to_s("%Y-%m-%d")
            link post.title, to: Blog::Posts::Show.with(post.slug)
          end
        end
      end
    end
  end
end
