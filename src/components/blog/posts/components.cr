require "markdown"
require "string_scanner"

module Blog::Posts::Components
  @renderer = PostContentRenderer.new

  private def single_post(post : PublishedPost)
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

  private def single_post(post : Post)
    single_post(PublishedPost.new(post))
  end

  private def content(post : PublishedPost)
    raw @renderer.render(post)
  end

  private def post_meta(post : PublishedPost)
    span "Published on #{post_date(post)}", class: "post-title-meta"
  end

  private def post_date(post : PublishedPost)
    Time::Format.new("%B %-d, %Y").format(post.published_at)
  end
end
