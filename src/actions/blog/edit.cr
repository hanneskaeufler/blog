class Blog::Posts::Edit < BrowserAction
  get "/posts/:id/edit" do
    post = PostQuery.new.find(id)
    render Blog::Posts::EditPage, post: post, post_form: PostForm.new(post)
  end
end
