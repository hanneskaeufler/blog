require "../spec_helper"

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
      build_post((1..10).join(" ")).reading_time.should eq "less than a minute"
      build_post((1..200).join(" ")).reading_time.should eq "about 1 min"
      build_post((1..(200 * 20)).join(" ")).reading_time.should eq "about 20 min"
    end
  end
end
