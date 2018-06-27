def insert_post(title = "title", content = "content", published_at = Time.now - 1.day, updated_at = Time.now)
  LuckyRecord::Repo.run do |db|
    db.exec "INSERT into posts(id, created_at, updated_at, title, content, published_at, slug) VALUES ($1, $2, $3, $4, $5, $6, $7)",
      UUID.random.to_s,
      Time.now,
      updated_at,
      title,
      content,
      published_at,
      title.downcase.gsub(" ", "-")
  end
end
