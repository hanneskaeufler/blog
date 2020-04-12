require "markd"

class PostContentRenderer
  def render(post : Post) : String
    content = downgrade_headings(post.content)
    markdown = Markd.to_html(content).rstrip("\n")
    convert_doubletilde_to_del_tag(markdown)
  end

  private def convert_doubletilde_to_del_tag(markdown : String)
    markdown.gsub(/~~([\s\w.]+?)~~/, "<del>\\1</del>")
  end

  private def downgrade_headings(content : String)
    content.gsub(/(^|\n)#/, "\\0#")
  end
end
