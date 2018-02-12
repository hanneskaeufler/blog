describe PostContentRenderer do
  it "downgrades headings" do
    post = build_post(content: "Yo hello\n# Title\n well ...")
    PostContentRenderer.new.render(post).should contain("\n<h2>")
  end
end
