class Blog::Posts::IndexPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  SOCIALS = {
    :github => "https://github.com/hanneskaeufler",
    :facebook => "https://facebook.com/hanneskaeufler",
    :twitter => "https://twitter.com/hanneskaeufler",
    :xing => "https://www.xing.com/profile/Hannes_Kaeufler"
  }

  needs posts : Array(Post)
  needs posts_count : Int32
  needs current_page : Int32

  def inner
    render_header
    render_posts(@posts)
    render_footer
  end

  private def render_header
    header class: "blog-title" do
      intro
    end
  end

  private def render_posts(posts : Array(Post))
    section class: "posts-container" do
      @posts.each { |post| single_post(post) }
      link(to: Blog::Posts::Index.path(previous_page)) { raw "&laquo; Previous page" } if has_previous_page?
      raw " &middot; " if has_previous_page? && has_next_page?
      link(to: Blog::Posts::Index.path(next_page)) { raw "Next page &raquo;" } if has_next_page?
    end
  end

  private def has_previous_page?
    @current_page > 1
  end

  private def has_next_page?
    @current_page * PostQuery::PER_PAGE < @posts_count
  end

  private def previous_page
    @current_page - 1
  end

  private def next_page
    @current_page + 1
  end

  private def intro
    section class: "intro" do
      ul do
        SOCIALS.each do |name, href|
          li do
            link to: href do
              img src: dynamic_asset("logos/#{name}.svg")
              text name.to_s
            end
          end
        end
      end
      render_tagline
    end
  end
end