class AddSlugToPosts::V20171220204327 < Avram::Migrator::Migration::V1
  def migrate
    alter :posts do
      add slug : String?
    end

    execute "UPDATE posts SET slug = regexp_replace(lower(title), '\\s', '-', 'g')"
  end

  def rollback
    alter :posts do
      remove :slug
    end
  end
end
