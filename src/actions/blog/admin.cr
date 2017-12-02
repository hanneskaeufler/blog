class Blog::Admin < BrowserAction
  get "/admin" do
    render Blog::AdminPage
  end
end
