class Blog::Posts::New < BrowserAction
  get "/posts/new" do
    render Blog::Posts::NewPage, post_form: PostForm.new
  end
end
