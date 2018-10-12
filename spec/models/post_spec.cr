describe Post do
  describe "#word_count" do
    it "returns the number of words in the post content" do
      build_post("").word_count.should eq 0
      build_post("one").word_count.should eq 1
      build_post("one two three for five").word_count.should eq 5
      build_post("one  two").word_count.should eq 2
    end
  end

  describe "#reading_time" do
    it "estimates reading time based on 200 wpm" do
      range = 1..10
      build_post(range.join(" ")).reading_time.should eq "less than a minute"
      range = 1..200
      build_post(range.join(" ")).reading_time.should eq "about 1 min"
      range_end = 200 * 20
      range = 1..range_end
      build_post(range.join(" ")).reading_time.should eq "about 20 min"
    end
  end
end
