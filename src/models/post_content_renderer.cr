class PostContentRenderer
  def render(post : Post) : String
    content = downgrade_headings(post.content)

    matches = [] of String
    html_snippets = [] of String

    scanner = StringScanner.new(content)

    while scanner.skip_until(/RAW_HTML_START(.+?)RAW_HTML_END/m)
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

    handle_strikethrough(markdown)
  end

  private def handle_strikethrough(markdown : String)
    markdown.gsub(/~~([\s\w.]+?)~~/, "<del>\\1</del>")
  end

  private def downgrade_headings(content : String)
    content.gsub(/(^|\n)#/, "\\0#")
  end
end
