class Blog::NotFoundPage < MainLayout
  include Blog::Components

  def inner
    section class: "posts-container" do
      h1 "Not Found"
      raw "<pre style=\"font-size: 5em\">¯\_(ツ)_/¯</pre>"
    end
    render_footer
  end
end
