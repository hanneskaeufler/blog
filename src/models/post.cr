class Post < BaseModel
  table :posts do
    field title : String
    field content : String
    field published_at : Time
    field slug : String
  end
end
