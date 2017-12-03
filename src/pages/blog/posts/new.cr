class Blog::Posts::NewPage < MainLayout
  def inner_head
    css_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css"
    js_link "https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"
    raw "<script>document.addEventListener('DOMContentLoaded', function() { var simplemde = new SimpleMDE(); }, false);</script>"
  end

  def inner
    section class: "post-editor" do
      h1 "New post"
      textarea
    end
  end
end
