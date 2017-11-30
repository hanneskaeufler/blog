require "markdown"

class Blog::IndexPage < MainLayout
  needs posts : Array(Post)

  def inner
    header class: "blog-title" do
      intro
    end

    section class: "posts-container" do
      @posts.each do |post|
        single_post(post)
      end
    end
  end

  private def single_post(post : Post)
    article do
      header class: "post-title" do
        h2 post.title
        span post.published_at.to_s, class: "meta"
      end
      content(post)
    end
  end

  private def content(post : Post)
    raw Markdown.to_html(downgrade_headings(post.content))
  end

  private def downgrade_headings(content : String)
    content.gsub(/\n#/, "##")
  end

  private def intro
    socials = {
      :github => "https://github.com/hanneskaeufler",
      :facebook => "https://facebook.com/hanneskaeufler",
      :twitter => "https://twitter.com/hanneskaeufler"
    }
    section class: "intro" do
      h1 "Hannes Käufler"
      ul do
        socials.each do |name, href|
          li do link name.to_s, to: href end
        end
      end
    end
  end

  private def eyecatcher
    # https://codepen.io/rstacruz/pen/oxJqNv
    div class: "box" do
      div class: "wave -one"
      div class: "wave -two"
      div class: "wave -three"
    end
  end
end
