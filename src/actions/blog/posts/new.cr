class Blog::Posts::New < AdminAction
  get "/posts/new" do
    render Blog::Posts::NewPage, post_form: PostForm.new
  end
end
