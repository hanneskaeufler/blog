class Blog::Posts::New < BrowserAction
  get "/posts/new" do
    return render_text "Access denied" if Lucky::Env.production?

    render Blog::Posts::NewPage, post_form: PostForm.new
  end
end
