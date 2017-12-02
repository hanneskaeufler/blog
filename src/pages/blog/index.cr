require "markdown"
require "string_scanner"

class Blog::IndexPage < MainLayout
  SOCIALS = {
    :github => "https://github.com/hanneskaeufler",
    :facebook => "https://facebook.com/hanneskaeufler",
    :twitter => "https://twitter.com/hanneskaeufler"
  }

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

    matches = [] of String
    html_snippets = [] of String

    scanner = StringScanner.new(content)

    while scanner.skip_until(/RAW_HTML_START(.+?)RAW_HTML_END/)
      if scanner[0]? && scanner[1]?
          matches << scanner[0]
          html_snippets << scanner[1]
      end
    end

    matches.each_with_index do |match, index|
      content = content.gsub(match, "RAW_HTML_#{index}")
    end

    markdown = Markdown.to_html(content)

    html_snippets.each_with_index do |snippet, index|
      markdown = markdown.gsub("RAW_HTML_#{index}", "</p>#{snippet}<p>")
    end

    raw markdown
  end

  private def downgrade_headings(content : String)
    content.gsub(/\n#/, "##")
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
        h4 "From Germany with ❤️"
        text "This blog is open source, check it out on "
        link "Github", to: "https://github.com/hanneskaeufler/blog"
        text ". It is served by "
        link "Heroku", to: "https://heroku.com"
        text ", written in "
        link "Crystal", to: "https://crystal-lang.org"
        text " and built with the awesome "
        link "Lucky Framework", to: "https://luckyframework.org"
        text "."
      end
    end
  end
end
