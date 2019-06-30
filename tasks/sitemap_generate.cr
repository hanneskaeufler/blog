require "lucky_cli"
require "sitemapper"

class Sitemap::Generate < LuckyCli::Task
  summary "Generate sitemap tarball for manual upload to uri as can be seen in public/robots.txt"

  def call
    Sitemapper.configure do |c|
      c.use_index = false
      c.host = Lucky::RouteHelper.settings.base_uri
      c.max_urls = 500
      c.compress = true
    end

    sitemaps = Sitemapper.build do
      add("/", lastmod: Time.local, priority: 1.0)
      add("/archive", lastmod: Time.local, priority: 0.9)

      PostQuery.new.published.each do |post|
        add(Blog::Posts::Show.path(post.slug), lastmod: post.updated_at, priority: 0.8)
      end
    end

    Sitemapper.store(sitemaps, "./")
  end
end
