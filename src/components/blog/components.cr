module Blog::Components
  private def render_footer
    footer class: "blog-footer" do
      imprint
    end
  end

  private def imprint
    section do
      div do
        h4 "Imprint"
        text "Hannes Käufler"
        br
        text "Gotenstraße 17"
        br
        text "89610 Oberdischingen"
      end
      div do
        h4 "From Germany with ❤️"
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
    end
  end
end