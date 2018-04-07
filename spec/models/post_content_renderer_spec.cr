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
end
