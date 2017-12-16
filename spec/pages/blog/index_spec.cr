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

  it "shows next page link for more than 5 posts" do
    html = rendered([] of Post, posts_count: 7)

    html.should contain "<a href=\"/?page&#61;2\">Next page &raquo;</a>"
  end

  it "shows prev page link when on page 2" do
    html = rendered([] of Post, posts_count: 7, on_page: 2)

    html.should contain "<a href=\"/\">&laquo; Previous page</a>"
  end

  it "shows third and first page link when on page 2" do
    html = rendered([] of Post, posts_count: 14, on_page: 2)

    html.should contain "<a href=\"/\">&laquo; Previous page</a>"
    html.should contain "<a href=\"/?page&#61;3\">Next page &raquo;</a>"
  end
end

private def rendered(posts, posts_count = 5, on_page = 1)
  Blog::IndexPage.new(
    flash: empty_flash,
    posts: posts,
    posts_count: posts_count,
    current_page: on_page).render.to_s
end
