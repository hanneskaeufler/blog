require "../spec_helper"
require "../../tasks/sitemap_generate"

SITEMAP = "./sitemap.xml.gz"

describe Sitemap::Generate do
  it "generates a sitemap" do
    File.delete(SITEMAP) if File.exists?(SITEMAP)
    Sitemap::Generate.new.call

    File.exists?(SITEMAP).should eq true
  end
end
