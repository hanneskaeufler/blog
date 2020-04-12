require "../../../spec_helper"

describe Blog::Posts::IndexPage do
  it "renders markdown to html" do
    post = build_post(content: "Hi [Google](http://google.de). ~~bam bam.~~")

    rendered([post]).should contain "Hi <a href=\"http://google.de\">Google</a>. <del>bam bam.</del>"
  end

  it "downgrades headings by one" do
    post = build_post(content: "\n# H1 Heading")

    rendered([post]).should contain "<h2>H1 Heading</h2>"
  end

  it "can handle raw html" do
    post = build_post(content: "Some text. <br id=\"must-remain\">. More text")

    html = rendered([post])

    html.should contain "<br id=\"must-remain\">"
  end

  it "shows next page link for more than 5 posts" do
    html = rendered([] of Post, posts_count: 7)

    html.should contain "<a href=\"/?page=2\">Next page &raquo;</a>"
  end

  it "shows prev page link when on page 2" do
    html = rendered([] of Post, posts_count: 7, on_page: 2)

    html.should contain "<a href=\"/\">&laquo; Previous page</a>"
  end

  it "shows third and first page link when on page 2" do
    html = rendered([] of Post, posts_count: 14, on_page: 2)

    html.should contain "<a href=\"/\">&laquo; Previous page</a>"
    html.should contain "<a href=\"/?page=3\">Next page &raquo;</a>"
  end
end

private def rendered(posts, posts_count = 5, on_page = 1)
  Blog::Posts::IndexPage.new(
    context: context,
    posts: posts,
    posts_count: posts_count,
    current_page: on_page).render.to_s
end
