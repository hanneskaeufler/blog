class Blog::Index < BrowserAction
  get "/" do
    page = params.get(:page)
    if page
      page = page.to_i
    else
      page = 1
    end

    posts = PostQuery.new.latest(page: page).results
    render Blog::IndexPage, posts: posts
  end
end
