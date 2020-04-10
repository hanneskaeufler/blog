class Blog::Posts::Update < AdminAction
  put "/posts/:id/update" do
    post = PostQuery.new.find(id)
    SavePost.update(post, params) do |form, updated_post|
      if form.saved?
        flash.success = "Post successfully edited."
        redirect Blog::Posts::Index
      else
        html Blog::Posts::EditPage, post: updated_post, post_form: form
      end
    end
  end
end
