class Blog::Index < BrowserAction
  get "/" do
    posts = PostQuery.new.latest.results
    render Blog::IndexPage, posts: posts
  end
end
