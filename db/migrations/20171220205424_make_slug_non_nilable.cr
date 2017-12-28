class MakeSlugNonNilable::V20171220205424 < LuckyMigrator::Migration::V1
  def migrate
    execute "UPDATE posts SET slug = regexp_replace(lower(title), '\\s', '-', 'g')"
    execute "ALTER table posts ALTER slug SET NOT NULL"
  end

  def rollback
    execute "ALTER table posts ALTER slug DROP NOT NULL"
  end
end
