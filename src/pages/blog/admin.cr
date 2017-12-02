class Blog::AdminPage < MainLayout
  def inner
    section class: "post-editor" do
      h1 "New post"
      textarea
      raw "<script>document.addEventListener('DOMContentLoaded', function() { var simplemde = new SimpleMDE(); }, false);</script>"
    end
  end
end
