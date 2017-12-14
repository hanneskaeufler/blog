class Blog::Index < BrowserAction
  param page : Int32 = 1

  get "/" do
    posts = PostQuery.new.latest(page: page).results
    posts_count = Int32.new(PostQuery.new.published.count)
    render Blog::IndexPage, posts: posts, posts_count: posts_count, current_page: page
  end
end
