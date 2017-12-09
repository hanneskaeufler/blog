
class Blog::IndexPage < MainLayout
  include Blog::Components
  include Blog::Posts::Components

  SOCIALS = {
    :github => "https://github.com/hanneskaeufler",
    :facebook => "https://facebook.com/hanneskaeufler",
    :twitter => "https://twitter.com/hanneskaeufler",
    :xing => "https://www.xing.com/profile/Hannes_Kaeufler"
  }

  needs posts : Array(Post)

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
    end
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
