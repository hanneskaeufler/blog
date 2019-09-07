require "../spec_helper"

describe SavePost do
  it "generates a valid slug" do
    form = SavePost.new

    form.title.value = "is valid"
    form.prepare

    form.slug.value.should eq "is-valid"
  end

  it "generates a valid slug with chars that would need to be url escaped" do
    form = SavePost.new

    form.title.value = "this: is &a /crazy .post"
    form.prepare

    form.slug.value.should eq "this-is-a-crazy-post"
  end
end
