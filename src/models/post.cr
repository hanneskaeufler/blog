class Post < BaseModel
  table :posts do
    column title : String
    column content : String
    column published_at : Time?
    column slug : String
  end
end
