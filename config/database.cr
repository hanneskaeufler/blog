database = "blog_#{Lucky::Env.name}"

LuckyRecord::Repo.configure do |settings|
  if Lucky::Env.production?
    settings.url = ENV.fetch("DATABASE_URL")
  else
    settings.url = ENV["DATABASE_URL"]? || LuckyRecord::PostgresURL.build(
      hostname: "localhost",
      database: database
    )
  end
  settings.lazy_load_enabled = Lucky::Env.production?
end
