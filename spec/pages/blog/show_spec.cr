require "../../spec_helper"

describe Blog::ShowPage do
  it "shows the published date" do
    post = build_post("Boring content", Time.new(2012, 4, 30))
    rendered(post).should contain("Published on April 30, 2012")
  end
end

private def rendered(post)
  Blog::ShowPage.new(flash: empty_flash, post: post).render.to_s
end
