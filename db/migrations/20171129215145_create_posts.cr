class CreatePosts::V20171129215145 < LuckyMigrator::Migration::V1
  def migrate
    create :posts do
     add title : String
     add content : String
     add published_at : Time
    end
  end

  def rollback
    drop :posts
  end
end
