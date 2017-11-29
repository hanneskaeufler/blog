class Post < BaseModel
  table :posts do
    field title : String
    field content : String
    field published_at : Time
  end
end
