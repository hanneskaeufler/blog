require "markdown"
require "string_scanner"

module Blog::Posts::Components
  @renderer = PostContentRenderer.new

  private def single_post(post : Post)
    article do
      header class: "post-title" do
        h2 do
          text post.title
          link "#", to: Blog::Posts::Show.with(post.slug)
        end
        post_meta(post)
      end
      content(post)
    end
  end

  private def content(post : Post)
    raw @renderer.render(post)
  end

  private def post_meta(post : Post)
    span "Published on #{post_date(post)}", class: "post-title-meta"
  end

  private def post_date(post : Post)
    Time::Format.new("%B %-d, %Y").format(post.published_at)
  end
end
