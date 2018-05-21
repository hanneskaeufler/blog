module Blog::Components
  TAGLINE = "racing &middot; software &middot; open-source"

  SOCIALS = {
    :github   => "https://github.com/hanneskaeufler",
    :facebook => "https://facebook.com/hanneskaeufler",
    :twitter  => "https://twitter.com/hanneskaeufler",
    :xing     => "https://www.xing.com/profile/Hannes_Kaeufler",
  }

  private def render_tagline
    div class: "tag-line" do
      h1 do
        raw TAGLINE
      end
    end
  end

  private def render_small_header
    header class: "blog-title-small" do
      render_tagline
    end
  end

  private def render_footer
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
          text "Gotenstraße 17"
          br
          text "89610 Oberdischingen"
        end
        ul do
          SOCIALS.each do |name, href|
            li do
              link to: href do
                img src: dynamic_asset("assets/logos/#{name}.svg"), alt: "social logo #{name}"
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
        raw "&copy; #{Time.now.year}"
      end
    end
  end
end
