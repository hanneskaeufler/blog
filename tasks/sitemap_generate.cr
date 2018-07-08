require "lucky_cli"
require "sitemapper"

class Sitemap::Generate < LuckyCli::Task
  banner "Generate sitemap"

  def call
    Sitemapper.configure do |c|
      c.use_index = false
      c.host = Lucky::RouteHelper.settings.base_uri
      c.max_urls = 500
      c.compress = true
    end

    sitemaps = Sitemapper.build do
      add("/", lastmod: Time.now, priority: 1.0)
      add("/archive", lastmod: Time.now, priority: 0.9)

      PostQuery.new.published.each do |post|
        add(Blog::Posts::Show.path(post.slug), lastmod: post.updated_at, priority: 0.8)
      end
    end

    Sitemapper.store(sitemaps, "./")
  end
end
