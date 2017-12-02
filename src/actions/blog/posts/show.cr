class Blog::Posts::Show < BrowserAction
  get "/posts/:slug" do
    post = PostQuery.new.find_published_by_slug(slug)
    render_text "yay #{post.title}"
  end
end
