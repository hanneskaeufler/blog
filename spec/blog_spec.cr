require "./spec_helper"

describe Blog do
  describe "/" do
    it "shows a title" do
      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "<h1>Hannes Käufler</h1>"
    end

    it "shows posts" do
      insert_post title: "Sample post"
      insert_post title: "Lorem ipsum"

      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "Sample post"
      visitor.should contain "Lorem ipsum"
    end
  end
end

private def insert_post(title = "title", published_at = Time.now - 1.day)
  LuckyRecord::Repo.run do |db|
    db.exec "INSERT into posts(created_at, updated_at, title, content, published_at) VALUES ($1, $2, $3, $4, $5)",
      Time.now,
      Time.now,
      title,
      "content",
      published_at
  end
end
