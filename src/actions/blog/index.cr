class Blog::Index < BrowserAction
  optional_param page, default: "1"

  get "/" do
    posts = PostQuery.new.latest(page: page.to_i).results
    render Blog::IndexPage, posts: posts
  end
end
