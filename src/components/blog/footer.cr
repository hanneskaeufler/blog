class Blog::Components::Footer < BaseComponent
  def render
    footer class: "blog-footer" do
      imprint
    end
  end

  private def imprint
    section do
      div do
        h4 "Imprint"
        address do
          text "Dipl.-Ing. Hannes Käufler"
          br
          text "Gluthstraße 8"
          br
          text "80807 München"
        end
        ul do
          SOCIALS.each do |name, href|
            li do
              link to: href do
                img src: dynamic_asset("logos/#{name}.svg"), alt: "social logo #{name}"
              end
            end
          end
        end
      end
      div do
        h4 "From Germany with ❤️"
        para do
          text "This blog is open source, check it out on "
          link "Github", to: "https://github.com/hanneskaeufler/blog"
          text ". It is served by "
          link "Heroku", to: "https://heroku.com"
          text ", written in "
          link "Crystal", to: "https://crystal-lang.org"
          text " and built with the awesome "
          link "Lucky Framework", to: "https://luckyframework.org"
          text "."
        end
        raw "&copy; #{Time.local.year}"
      end
    end
  end
end