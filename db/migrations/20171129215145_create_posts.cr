class CreatePosts::V20171129215145 < Avram::Migrator::Migration::V1
  def migrate
    create :posts do
      primary_key id : Int32
      add_timestamps
      add title : String
      add content : String
      add published_at : Time
    end
  end

  def rollback
    drop :posts
  end
end
