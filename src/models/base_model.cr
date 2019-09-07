abstract class BaseModel < Avram::Model
  macro default_columns
    primary_key id : UUID
    timestamps
  end

  def self.database : Avram::Database.class
    AppDatabase
  end
end
