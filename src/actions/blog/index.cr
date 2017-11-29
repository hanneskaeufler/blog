class Blog::Index < BrowserAction
  get "/" do
    render Blog::IndexPage
  end
end
