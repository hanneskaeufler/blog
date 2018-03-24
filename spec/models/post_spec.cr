describe Post do
  describe "#word_count" do
    it "returns the number of words in the post content" do
      build_post("").word_count.should eq 0
      build_post("one").word_count.should eq 1
      build_post("one two three for five").word_count.should eq 5
      build_post("one  two").word_count.should eq 2
    end
  end
end
