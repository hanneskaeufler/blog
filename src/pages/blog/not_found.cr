class Blog::NotFoundPage < MainLayout

  def content
    section class: "posts-container" do
      h1 "Not Found"
      para do
        raw "You might have been looking for one of my "
        link "blog posts", to: Blog::Posts::Index
        raw "?"
      end
      raw "<pre style=\"font-size: 5em;\">¯\\_(ツ)_/¯</pre>"
    end
    mount Blog::Components::Footer.new
  end
end
