class Blog::Posts::IndexPage < MainLayout
  include Blog::Components

  needs posts : Array(Post)
  needs posts_count : Int32
  needs current_page : Int32

  def content
    render_header
    render_posts(@posts)
    mount Blog::Components::Footer.new
  end

  private def render_header
    header class: "blog-title" do
      mount Blog::Components::Intro.new
    end
  end

  private def render_posts(posts : Array(Post))
    section class: "posts-container" do
      @posts.each { |post| mount Blog::Posts::Components::FullPost.new(post) }
      link(to: Blog::Posts::Index.path(previous_page)) { raw "&laquo; Previous page" } if previous_page_exists?
      raw " &middot; " if previous_page_exists? && next_page_exists?
      link(to: Blog::Posts::Index.path(next_page)) { raw "Next page &raquo;" } if next_page_exists?
    end
  end

  private def previous_page_exists?
    @current_page > 1
  end

  private def next_page_exists?
    @current_page * PostQuery::PER_PAGE < @posts_count
  end

  private def previous_page
    @current_page - 1
  end

  private def next_page
    @current_page + 1
  end
end
