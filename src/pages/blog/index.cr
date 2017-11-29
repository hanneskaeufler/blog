require "markdown"

class Blog::IndexPage < MainLayout
  def inner
    raw Markdown.to_html("## yo")
  end
end
