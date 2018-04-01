class Blog::ArchivePage < MainLayout
  include Blog::Components

  needs posts : Array(Post)
  needs current_search_term : String

  def content
    render_small_header
    section class: "posts-archive" do
      h2 "Archive"
      render_search_form(@current_search_term)
      render_post_titles(posts_by_year(@posts))
    end
    render_footer
  end

  private def posts_by_year(posts)
    posts.group_by { |post| post.published_at.year }
  end

  private def render_search_form(current_search_term)
    form_for Blog::Search do
      input type: "text", value: current_search_term, name: "q", placeholder: "Search here ..."
      raw "<button type=\"submit\">Search</button>"
      link "Reset", to: Blog::Archive
    end
  end

  private def render_post_titles(posts_by_year)
    if posts_by_year.empty?
      return div do
        para "No posts found."
      end
    end

    posts_by_year.each do |year, posts|
      h3 year
      ul do
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
