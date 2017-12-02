require "../../spec_helper"

describe Blog::IndexPage do
  it "renders markdown to html" do
    post = build_post(content: "[Google](http://google.de)")

    rendered([post]).should contain "<a href=\"http://google.de\">Google</a>"
  end

  it "downgrades headings by one" do
    post = build_post(content: "\n# H1 Heading")

    rendered([post]).should contain "<h2>H1 Heading</h2>"
  end

  it "can handle raw html, and assumes closing and opening paragraphs" do
    # what. a. hack. https://github.com/crystal-lang/crystal/issues/4613
    post = build_post(content: "<p>Some text. RAW_HTML_START<br id=\"must-remain\">RAW_HTML_END. More text</p>")

    html = rendered([post])

    html.should contain "</p><br id=\"must-remain\"><p>"
    html.should_not contain "RAW_HTML_START"
    html.should_not contain "RAW_HTML_END"
  end
end

private def rendered(posts)
  Blog::IndexPage.new(flash: flash, posts: posts).render.to_s
end

private def flash
  Lucky::Flash::Store.new
end

private def build_post(content)
  Post.new(1, Time.now, Time.now, "title", content, Time.now)
end
