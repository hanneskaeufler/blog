class Blog::Posts::Update < AdminAction
  put "/posts/:id/update" do
    post = PostQuery.new.find(id)
    PostForm.update(post, params, current_title: post.title) do |form, updated_post|
      if form.saved?
        flash.success = "Post successfully edited."
        redirect Blog::Posts::Index
      else
        render Blog::Posts::EditPage, post: updated_post, post_form: form
      end
    end
  end
end
