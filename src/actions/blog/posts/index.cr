class Blog::Posts::Index < BrowserAction
  param page : Int32 = 1

  get "/" do
    unless page > 0
      return redirect to: Blog::Posts::Index
    end

    posts_count = Int32.new(PostQuery.new.published.count)
    posts = PostQuery.new.latest(page: page).results
    render Blog::Posts::IndexPage, posts: posts, posts_count: posts_count, current_page: page
  end
end
