class Blog::Index < BrowserAction
  optional_param page, default: "1"

  get "/" do
    posts = PostQuery.new.latest(page: page.to_i).results
    posts_count = Int32.new(PostQuery.new.published.count)
    render Blog::IndexPage, posts: posts, posts_count: posts_count, current_page: page.to_i
  end
end
