require "../../spec_helper"

describe Blog::ShowPage do
end

private def rendered(post)
  Blog::ShowPage.new(flash: empty_flash, post: post).render.to_s
end
