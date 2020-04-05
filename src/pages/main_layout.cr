abstract class MainLayout
  include Lucky::HTMLPage

  def inner_head
  end

  abstract def content

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        csrf_meta_tags
        responsive_meta_tag
        meta rel: "alternate", title: Blog::Components::Tagline::TAGLINE, href: "/feed.json"
        css_link(asset("images/favicon.png"), rel: "icon")
        title page_title
        raw "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/normalize.min.css\">"
        css_link asset("css/app.css")
        raw "<script src=\"https://cdn.jsdelivr.net/npm/rails-ujs@5.2.4-2/lib/assets/compiled/rails-ujs.min.js\"></script>"
        raw "<script src=\"https://cdn.jsdelivr.net/npm/turbolinks@5.2.0/dist/turbolinks.min.js\"></script>"
        js_link asset("js/app.js")
        inner_head
        mount Blog::Components::GoogleAnalytics.new(Lucky::Env.production?)
      end

      body do
        mount Shared::FlashMessages.new(@context.flash)
        content
      end
    end
  end

  def page_title
    "Hannes Käufler: Blog#{page_title_suffix}"
  end

  def page_title_suffix
    ""
  end
end
