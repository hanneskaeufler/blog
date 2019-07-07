class Blog::Components::Tagline < BaseComponent
  TAGLINE = "racing &middot; software &middot; open-source"

  def render
    div class: "tag-line" do
      h1 do
        raw TAGLINE
      end
    end
  end
end
