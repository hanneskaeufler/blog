class Blog::Components::SmallHeader < BaseComponent
  def render
    header class: "blog-title-small" do
      mount Tagline.new
    end
  end
end
