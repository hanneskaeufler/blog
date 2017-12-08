def insert_post(title = "title", content = "content", published_at = Time.now - 1.day)
  LuckyRecord::Repo.run do |db|
    db.exec "INSERT into posts(created_at, updated_at, title, content, published_at) VALUES ($1, $2, $3, $4, $5)",
      Time.now,
      Time.now,
      title,
      content,
      published_at
  end
end
