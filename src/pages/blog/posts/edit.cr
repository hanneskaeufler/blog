class Blog::Posts::EditPage < MainLayout
  include Blog::Components

  needs post_form : PostForm
  needs post : Post

  def inner_head
    css_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css"
    js_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"
    raw "<script>document.addEventListener('DOMContentLoaded', function() { var simplemde = new SimpleMDE(); }, false);</script>"
  end

  def content
    render_small_header
    section class: "post-editor" do
      render_post_form(@post_form)
    end
    render_footer
  end

  private def render_post_form(f)
    form_for Blog::Posts::Update.with(@post) do
      h1 "Edit post"
      div class: "form-row" do
        label_for f.title
        text_input f.title
        errors_for f.title
      end
      div class: "form-row" do
        label_for f.content
        textarea f.content
        errors_for f.content
      end

      submit "Save Post"
    end
  end
end
