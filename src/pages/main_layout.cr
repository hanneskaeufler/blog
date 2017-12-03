abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrorsComponent
  include Shared::FlashComponent

  needs flash : Lucky::Flash::Store

  def inner_head
  end

  abstract def inner

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        title page_title
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        inner_head
      end

      body do
        render_flash
        inner
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
