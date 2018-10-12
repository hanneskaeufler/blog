class Blog::Archive < BrowserAction
  get "/archive" do
    render Blog::ArchivePage,
      posts: PostQuery.new.published.results,
      current_search_term: ""
  end
end
