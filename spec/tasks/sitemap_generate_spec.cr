require "gzip"
require "xml"
require "../spec_helper"

SITEMAP = "./sitemap.xml.gz"

describe Sitemap::Generate do
  it "generates a gzipped sitemap" do
    File.delete(SITEMAP) if File.exists?(SITEMAP)
    Sitemap::Generate.new.call

    File.exists?(SITEMAP).should eq true
  end

  it "contains an entry for root, archive and each post" do
    insert_post title: "earlier_post", published_at: Time.utc - 4.days

    Sitemap::Generate.new.call

    Gzip::Reader.open(SITEMAP) do |gzip|
      document = XML.parse(gzip.gets_to_end)
      urls = document.first_element_child.not_nil!.children.select(&.element?)
      urls.size.should eq 3
    end
  end
end
