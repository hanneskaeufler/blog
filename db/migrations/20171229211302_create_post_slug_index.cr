class CreatePostSlugIndex::V20171229211302 < LuckyMigrator::Migration::V1
  def migrate
    create_index :posts, :slug, unique: true
  end

  def rollback
    drop_index :posts, :slug
  end
end