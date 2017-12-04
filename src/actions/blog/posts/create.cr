class Blog::Posts::Create < BrowserAction
  post "/posts/create" do
    PostForm.create(params) do |form, post|
      if post
        redirect Blog::Index
      else
        render Blog::Posts::NewPage, post_form: form
      end
    end
  end
end
