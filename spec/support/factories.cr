def insert_post(title = "title", content = "content", published_at = Time.local - 1.day, updated_at = Time.local)
  Avram::Repo.run do |db|
    db.exec "INSERT into posts(id, created_at, updated_at, title, content, published_at, slug) VALUES ($1, $2, $3, $4, $5, $6, $7)",
      UUID.random.to_s,
      Time.local,
      updated_at,
      title,
      content,
      published_at,
      title.downcase.gsub(" ", "-")
  end
end
