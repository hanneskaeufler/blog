require "../../../spec_helper"

describe Blog::Posts::ShowPage do
  it "shows the published date" do
    post = build_post("Boring content", Time.new(2012, 4, 30))
    rendered(post).should contain("Published on April 30, 2012")
  end

  it "shows a word count" do
    post = build_post("this post has exactly six words")
    rendered(post).should contain(" · 6 words")
  end

  it "shows a estimated reading time" do
    post = build_post("this post has exactly six words")
    rendered(post).should contain(" · less than a minute reading time")
  end
end

private def rendered(post)
  Blog::Posts::ShowPage.new(context: context, post: post).render.to_s
end
