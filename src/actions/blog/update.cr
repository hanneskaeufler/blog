class Blog::Posts::Update < BrowserAction
  put "/posts/:id/update" do
    form = PostForm.new(PostQuery.new.find(id))
    render_text "foo"
  end
end
