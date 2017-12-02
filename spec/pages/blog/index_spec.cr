require "../../spec_helper"

describe Blog::IndexPage do
  it "renders markdown to html" do
    post = build_post(content: "Hi [Google](http://google.de). ~~bam bam.~~")

    rendered([post]).should contain "Hi <a href=\"http://google.de\">Google</a>. <del>bam bam.</del>"
  end

  it "downgrades headings by one" do
    post = build_post(content: "\n# H1 Heading")

    rendered([post]).should contain "<h2>H1 Heading</h2>"
  end

  it "can handle raw html, and assumes closing and opening paragraphs" do
    # what. a. hack. https://github.com/crystal-lang/crystal/issues/4613
    post = build_post(content: "Some text. RAW_HTML_START<br id=\"must-remain\">RAW_HTML_END. More text")

    html = rendered([post])

    html.should contain "</p><br id=\"must-remain\"><p>"
    html.should_not contain "RAW_HTML_START"
    html.should_not contain "RAW_HTML_END"
  end

  it "can handle multiple raw html blocks" do
    post = build_post(content: "Some text. RAW_HTML_START<br id=\"must-remain\">RAW_HTML_END. More text. RAW_HTML_START<i>hi</i>RAW_HTML_END")

    html = rendered([post])

    html.should contain "</p><br id=\"must-remain\"><p>"
    html.should contain "</p><i>hi</i><p>"
  end
end

private def rendered(posts)
  Blog::IndexPage.new(flash: empty_flash, posts: posts).render.to_s
end
