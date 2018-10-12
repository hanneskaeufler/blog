class Blog::Search < BrowserAction
  post "/search" do
    q = params.get(:q)
    render Blog::ArchivePage,
      posts: PostQuery.new.published_search(q).results,
      current_search_term: q
  end
end
