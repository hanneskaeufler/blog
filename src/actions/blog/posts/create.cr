class Blog::Posts::Create < BrowserAction
  post "/posts/create" do
    return render_text "Access denied" if Lucky::Env.production?

    PostForm.create(params) do |form, post|
      if post
        redirect Blog::Index
      else
        render Blog::Posts::NewPage, post_form: form
      end
    end
  end
end
