
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
    header class: "blog-title" do
      intro
    end

    section class: "posts-container" do
      @posts.each { |post| single_post(post) }
    end

    render_footer
  end

  private def intro
    section class: "intro" do
      ul do
        SOCIALS.each do |name, href|
          li do link name.to_s, to: href end
        end
      end
      div class: "tag-line" do
        h1 do
          raw "racing &middot; software &middot; open-source"
        end
      end
    end
  end
end
