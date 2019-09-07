class Blog::Posts::New < AdminAction
  get "/posts/new" do
    render Blog::Posts::NewPage, post_form: SavePost.new
  end
end
