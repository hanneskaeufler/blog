database = "blog_#{Lucky::Env.name}"

LuckyRecord::Repo.configure do
  if url = ENV["DATABASE_URL"]?
    settings.url = url
  else
    settings.url = LuckyRecord::PostgresURL.build(
      hostname: "localhost",
      database: database
    )
  end
end

LuckyMigrator::Runner.configure do
  settings.database = database
end
