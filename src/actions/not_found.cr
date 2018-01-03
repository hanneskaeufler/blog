class Blog::NotFound < BrowserAction
  def call
    render Blog::NotFoundPage
  end
end
