class Blog::Archive < BrowserAction
  get "/archive" do
    posts = PostQuery.new.published.results
    render Blog::ArchivePage, posts: posts
  end
end
