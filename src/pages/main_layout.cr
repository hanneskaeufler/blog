abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrorsComponent
  include Shared::FlashComponent

  # You can put things here that all pages need
  #
  # Example:
  #   needs current_user : User
  needs flash : Lucky::Flash::Store

  abstract def inner

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        title page_title
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        css_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css"
        js_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"
      end

      body do
        render_flash
        inner
      end
    end
  end

  def page_title
    "hannes.kaeufler.net"
  end
end