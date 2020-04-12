describe PostContentRenderer do
  it "downgrades headings" do
    renderer = PostContentRenderer.new
    post = build_post(content: "Yo hello\n# Title\n well ...")
    renderer.render(post).should contain("\n<h2>")

    post = build_post(content: "# Title")
    renderer.render(post).should contain("<h2>")
  end

  it "does not mess with hashes in text" do
    renderer = PostContentRenderer.new
    post = build_post(content: "Just some text containing a # innocent hash")

    renderer.render(post).should contain("Just some text containing a # innocent has")
  end

  it "replaces raw html between placeholders" do
    renderer = PostContentRenderer.new
    post = build_post(content: "Just some <br /> text")

    renderer.render(post).should eq("<p>Just some <br /> text</p>")
  end

  it "replaces raw html with line breaks between placeholders" do
    renderer = PostContentRenderer.new
    post = build_post <<-CONTENT
    Just some
    <raw-html></raw-html>
    text
    CONTENT

    renderer.render(post).should eq <<-CONTENT
    <p>Just some
    <raw-html></raw-html>
    text</p>
    CONTENT
  end
end
