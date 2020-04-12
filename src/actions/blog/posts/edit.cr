class Blog::Posts::Edit < AdminAction
  get "/posts/:id/edit" do
    post = PostQuery.new.find(id)
    html Blog::Posts::EditPage, post: post, post_form: SavePost.new(post)
  end
end
