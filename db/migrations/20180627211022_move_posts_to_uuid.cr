class MovePostsToUUID::V20180627211022 < LuckyRecord::Migrator::Migration::V1
  def migrate
    alter :posts do
      add new_id : UUID
    end
    # PostQuery.new.each do |post|
    #   new_id = UUID.random
    #   execute "UPDATE posts set new_id = '#{new_id}' where id = #{post.id}"
    # end
    # execute "ALTER TABLE posts DROP COLUMN id"
    # execute "ALTER TABLE posts RENAME COLUMN new_id TO id"
    # execute "ALTER TABLE posts add PRIMARY KEY (id)"
  end

  def rollback
    alter :posts do
      remove :new_id
    end
  end
end
