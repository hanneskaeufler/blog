class Blog::NotFoundPage < MainLayout
  include Blog::Components

  def inner
    section class: "posts-container" do
      h1 "Not Found"
      para do
        raw "You might have been looking for one of my "
        link "blog posts", to: Blog::Posts::Index
        raw "?"
      end
      raw "<pre style=\"font-size: 5em;\">¯\\_(ツ)_/¯</pre>"
    end
    render_footer
  end
end