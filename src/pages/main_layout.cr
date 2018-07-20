abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrors
  include Shared::FlashComponent

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
        meta rel: "alternate", title: "Racing, Software, Open-Source", href: "/feed.json"
        css_link(asset("images/favicon.png"), rel: "icon")
        title page_title
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        inner_head
      end

      body do
        render_flash
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
