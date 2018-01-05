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

  describe "#published" do
    it "yields only published posts" do
      insert_post title: "published", published_at: Time.now - 1.days
      insert_post title: "not published", published_at: Time.now + 1.day

      PostQuery.new.published.results
                             .map(&.title).should eq ["published"]
    end

    it "orders by published data" do
      insert_post title: "middle", published_at: Time.now - 2.day
      insert_post title: "oldest", published_at: Time.now - 3.day
      insert_post title: "newest", published_at: Time.now - 1.days

      PostQuery.new.published.results
                             .map(&.title).should eq ["newest", "middle", "oldest"]
    end
  end

  describe "#find_published_by_slug" do
    it "finds by title when already published" do
      insert_post title: "Published Post", published_at: Time.now - 1.days

      post = PostQuery.new.find_published_by_slug("published-post")
      post.title.should eq "Published Post"
    end

    it "raises when slug does not exist or not published" do
      expect_raises(LuckyRecord::RecordNotFoundError) do
        PostQuery.new.find_published_by_slug("published")
      end

      insert_post title: "unpublished", published_at: Time.now + 1.days
      expect_raises(LuckyRecord::RecordNotFoundError) do
        PostQuery.new.find_published_by_slug("unpublished")
      end
    end

    it "finds by slugs with dashes" do
      insert_post title: "Open-Source", published_at: Time.now - 1.days

      post = PostQuery.new.find_published_by_slug("open-source")
      post.title.should eq "Open-Source"
    end
  end

  describe "#published_search" do
    it "is like #published without a term" do
      insert_post title: "Jo dude", published_at: Time.now - 1.days
      insert_post title: "Whateves", published_at: Time.now - 1.days
      insert_post title: "Unpublished", published_at: Time.now + 1.days

      ref = PostQuery.new.published.results
      posts = PostQuery.new.published_search(nil).results

      posts.should eq ref
    end

    it "only returns matching posts" do
      insert_post content: "matcher", published_at: Time.now - 2.days
      insert_post content: "a match this", published_at: Time.now - 1.days
      insert_post published_at: Time.now - 1.days

      posts = PostQuery.new.published_search("match").results

      posts.map(&.content).should eq ["a match this", "matcher"]
    end
  end
end
