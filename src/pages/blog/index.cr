require "markdown"

class Blog::IndexPage < MainLayout
  RAW_START = "RAW_HTML_START"
  RAW_END = "RAW_HTML_END"

  needs posts : Array(Post)

  def inner
    header class: "blog-title" do
      intro
    end

    section class: "posts-container" do
      @posts.each { |post| single_post(post) }
    end

    footer class: "blog-footer" do
      imprint
    end
  end

  private def single_post(post : Post)
    article do
      header class: "post-title" do
        h2 post.title
        post_meta(post)
      end
      content(post)
    end
  end

  private def content(post : Post)
    content = downgrade_headings(post.content)
    raw = [] of String
    matches = /#{RAW_START}(.*)#{RAW_END}/.match(content)
    if matches
      content = content.gsub(matches[0], "RAW_1")
      raw << matches[1]
    end

    markdown = Markdown.to_html(content)

    if matches
      markdown = markdown.gsub("RAW_1", "</p>#{raw[0]}<p>")
    end
    raw markdown
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

  private def post_meta(post : Post)
    span post_date(post), class: "post-title-meta"
  end

  private def post_date(post : Post)
    Time::Format.new("%b %-d, %Y").format(post.published_at)
  end

  private def eyecatcher
    # https://codepen.io/rstacruz/pen/oxJqNv
    div class: "box" do
      div class: "wave -one"
      div class: "wave -two"
      div class: "wave -three"
    end
  end

  private def imprint
    section do
      div do
        h4 "Imprint"
        text "Hannes Käufler"
        br
        text "Gotenstraße 17"
        br
        text "89610 Oberdischingen"
      end
      div do
      end
    end
  end
end
