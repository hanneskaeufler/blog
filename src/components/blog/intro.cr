class Blog::Components::Intro < BaseComponent
  def render
    section class: "intro" do
      ul do
        SOCIALS.each do |name, href|
          li do
            a href: href do
              img src: dynamic_asset("logos/#{name}.svg"), alt: "social logo #{name}"
              text name.to_s
            end
          end
        end
      end
      mount Blog::Components::Tagline.new
    end
  end
end
