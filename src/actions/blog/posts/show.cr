class Blog::Posts::Show < BrowserAction
  get "/posts/:slug" do
    post = PostQuery.new.find_published_by_slug(slug)
    render Blog::ShowPage, post: post
  end
end