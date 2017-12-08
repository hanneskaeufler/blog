require "../spec_helper"

describe PostQuery do
  describe "#latest" do
    it "orders by published_at descending" do
      insert_post title: "earlier_post", published_at: Time.now - 4.days
      insert_post title: "later_post", published_at: Time.now - 1.days
      insert_post title: "middle_post", published_at: Time.now - 2.days

      PostQuery.new.latest.results
        .map(&.title).should eq ["later_post", "middle_post", "earlier_post"]
    end

    it "only returns published posts" do
      insert_post title: "published", published_at: Time.now - 1.days
      insert_post title: "not published", published_at: Time.now + 1.day

      PostQuery.new.latest.results
        .map(&.title).should eq ["published"]
    end

    it "shows 5 posts at most" do
      10.times { insert_post }
      PostQuery.new.latest.results.size.should eq 5
    end

    it "accepts a page param" do
      7.times { insert_post }
      PostQuery.new.latest(page: 2).results.size.should eq 2
    end

    it "can be counted" do
      PostQuery.new.latest.count.should eq 0
      2.times { insert_post }
      PostQuery.new.latest.count.should eq 2
    end
  end

  describe "#find_published_by_slug" do
    it "finds by title when already published" do
      insert_post title: "Published Post", published_at: Time.now - 1.days

      post = PostQuery.new.find_published_by_slug("published-post")
      post.title.should eq "Published Post"
    end

    it "raises when title does not exist" do
      expect_raises(LuckyRecord::RecordNotFoundError) do |exc|
        PostQuery.new.find_published_by_slug("published")
      end
    end
  end
end
