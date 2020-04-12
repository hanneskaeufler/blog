class Blog::Posts::New < AdminAction
  get "/posts/new" do
    html Blog::Posts::NewPage, post_form: SavePost.new
  end
end
