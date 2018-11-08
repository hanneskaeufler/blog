class Blog::Posts::Index < BrowserAction
  param page : Int32 = 1

  get "/" do
    return redirect to: Blog::Posts::Index if page <= 0

    posts_count = PostQuery.new.published.select_count.to_i
    posts = PostQuery.new.latest(page: page).results
    render Blog::Posts::IndexPage,
      posts: posts,
      posts_count: posts_count,
      current_page: page
  end
end
