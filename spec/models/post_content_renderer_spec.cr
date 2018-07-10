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
    post = build_post(content: "Just some RAW_HTML_START<br />RAW_HTML_END text")

    renderer.render(post).should eq("<p>Just some </p><br /><p> text</p>")
  end

  it "replaces raw html with line breaks between placeholders" do
    renderer = PostContentRenderer.new
    post = build_post <<-CONTENT
    Just some RAW_HTML_START
    <br />
    RAW_HTML_END text
    CONTENT

    renderer.render(post).should eq <<-CONTENT
    <p>Just some </p>
    <br />
    <p> text</p>
    CONTENT
  end
end
