require "../spec_helper"

describe PostForm do
  it "allows a title and some content" do
    body = <<-BODY
    #{URI.escape("post:title")}=a&#{URI.escape("post:content")}=b
    BODY
    request = HTTP::Request.new("POST", "/irrelevant", nil, body)
    params = Lucky::Params.new(request)
    PostForm.create(params) do |form, post|
      PostQuery.new.count.should eq 1
    end
  end
end
