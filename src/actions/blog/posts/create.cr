class Blog::Posts::Create < AdminAction
  post "/posts/create" do
    SavePost.create(params) do |form, post|
      if post
        flash.success = "Post successfully published."
        redirect Blog::Posts::Index
      else
        html Blog::Posts::NewPage, post_form: form
      end
    end
  end
end
