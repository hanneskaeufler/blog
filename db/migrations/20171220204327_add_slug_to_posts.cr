class AddSlugToPosts::V20171220204327 < LuckyMigrator::Migration::V1
  def migrate
    alter :posts do
      add slug : String?
    end
  end

  def rollback
    alter :posts do
      remove :slug
    end
  end
end
