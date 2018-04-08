require "../../../spec_helper"

describe Blog::Archive::Components do
  describe "#render_activity" do
    it "renders a table with a column for each year" do
      post = build_post("sample", Time.new(2018, 1, 1))

      rendered([post]).should contain("2018</td>")
    end

    it "renders 12 columns for each year" do
      posts = [
        build_post("sample", Time.new(2017, 1, 1)),
        build_post("sample", Time.new(2018, 1, 1)),
      ]

      rendered(posts).scan(/<td/).size.should eq(2 * 12 + 2)
    end

    it "renders the months name " do
      post = build_post("sample", Time.new(2018, 1, 1))

      rendered([post]).should contain("January")
    end
  end
end

class TestPage
  include Lucky::HTMLPage
  include Blog::Archive::Components

  def render(posts)
    render_activity(posts)
  end
end

def rendered(posts)
  TestPage.new(context).render(posts).to_s
end
