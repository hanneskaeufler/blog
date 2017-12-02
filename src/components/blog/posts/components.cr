require "markdown"
require "string_scanner"

module Blog::Posts::Components
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

  private def post_meta(post : Post)
    span post_date(post), class: "post-title-meta"
  end

  private def post_date(post : Post)
    Time::Format.new("%b %-d, %Y").format(post.published_at)
  end

end
