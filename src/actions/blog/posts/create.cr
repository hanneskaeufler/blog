class Blog::Posts::Create < BrowserAction
  post "/posts/create" do
    PostForm.create(params) do |form, post|
      if post
        render_text "Created!"
      else
        render Blog::Posts::NewPage, post_form: form
      end
    end
  end
end
