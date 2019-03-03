class MakeSlugNonNilable::V20171220205424 < Avram::Migrator::Migration::V1
  def migrate
    execute "ALTER table posts ALTER slug SET NOT NULL"
  end

  def rollback
    execute "ALTER table posts ALTER slug DROP NOT NULL"
  end
end
