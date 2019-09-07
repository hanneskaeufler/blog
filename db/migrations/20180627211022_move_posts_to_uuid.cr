class MovePostsToUUID::V20180627211022 < Avram::Migrator::Migration::V1
  def migrate
    ids = all_current_post_ids
    execute "ALTER TABLE posts ADD COLUMN new_id uuid"
    ids.each do |id|
      execute "UPDATE posts set new_id = '#{UUID.random}' where id = #{id}"
    end
    execute "ALTER TABLE posts ALTER COLUMN new_id SET NOT NULL"
    execute "ALTER TABLE posts DROP COLUMN id"
    execute "ALTER TABLE posts RENAME COLUMN new_id TO id"
    execute "ALTER TABLE posts ADD PRIMARY KEY (id)"
  end

  def rollback
    execute "ALTER TABLE posts DROP COLUMN id"
    execute "ALTER TABLE posts ADD COLUMN id SERIAL PRIMARY KEY"
  end

  def all_current_post_ids
    ids = [] of Int32
    AppDatabase.run do |db|
      db.query "SELECT id FROM posts" do |rs|
        rs.each do
          ids << rs.read(Int32)
        end
        ids
      end
    end
  end
end
