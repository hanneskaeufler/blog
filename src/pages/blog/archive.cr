class Blog::ArchivePage < MainLayout
  include Blog::Components

  needs posts : Array(Post)

  def inner
    render_small_header
    render_post_titles(posts_by_year(@posts))
    render_footer
  end

  private def posts_by_year(posts)
    posts.group_by { |post| post.published_at.year }
  end

  private def render_post_titles(posts_by_year)
    section class: "posts-archive" do
      h2 "Archive"
      ul do
        posts_by_year.each do |year, posts|
          h3 year
          posts.each do |post|
            li do
              span post.published_at.to_s("%b %-d")
              link post.title, to: Blog::Posts::Show.with(post.slug)
            end
          end
        end
      end
    end
  end
end
