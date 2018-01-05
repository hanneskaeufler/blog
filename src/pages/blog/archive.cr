class Blog::ArchivePage < MainLayout
  include Blog::Components

  needs posts : Array(Post)
  needs current_search_term : String

  def inner
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
    raw <<-HTML
    <form method="POST" action="/search">
      <input type="text" name="q" placeholder="Search here ..." value="#{current_search_term}">
      <button type="submit">Search</button>
      <a href="#{Blog::Archive.path}">Reset</a>
      <input type="hidden" name="_csrf" value="">
    </form>
    HTML

    if @posts.empty?
      div do
        para "No posts found."
      end
    end
  end

  private def render_post_titles(posts_by_year)
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
