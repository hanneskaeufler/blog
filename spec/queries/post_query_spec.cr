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

    # it "shows 5 posts at most" do
    #   10.times { insert_post }
    #   PostQuery.new.latest.results.size.should eq 5
    # end
  end
end
