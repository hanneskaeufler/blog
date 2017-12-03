class Blog::Admin < BrowserAction
  get "/posts/new" do
    render Blog::Posts::NewPage
  end
end
