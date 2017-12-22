class MakePublishedAtNilable::V20171222235419 < LuckyMigrator::Migration::V1
  def migrate
    execute "ALTER table posts ALTER published_at DROP NOT NULL"
  end

  def rollback
    execute "ALTER table posts ALTER published_at SET NOT NULL"
  end
end
