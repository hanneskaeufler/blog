describe Post do
  describe "#slug" do
    it "slugarizes the title" do
      Post.new(1, Time.now, Time.now, "What a day", "", Time.now)
        .slug.should eq "what-a-day"
      Post.new(1, Time.now, Time.now, "already-slugged", "", Time.now)
        .slug.should eq "already-slugged"
    end
  end
end
