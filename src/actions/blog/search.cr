class Blog::Search < BrowserAction
  param q : String

  post "/search" do
    render Blog::ArchivePage, posts: PostQuery.new.published_search(q).results, current_search_term: q
  end
end
