class Blog::Components::Intro < BaseComponent
  def render
    section class: "intro" do
      nav do
        ul class: "navigation" do
          li { link to: "#" { text "Blog Archive "; raw "&raquo;" } }
        end

        div do
          ul class: "social" do
            SOCIALS.each do |name, href|
              li do
                link to: href do
                  img src: dynamic_asset("logos/#{name}.svg"), alt: "social logo #{name}"
                  text name.to_s
                end
              end
            end
          end
        end
      end
      mount Blog::Components::Tagline.new
    end
  end
end
