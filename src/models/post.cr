class Post < BaseModel
  table :posts do
    column title : String
    column content : String
    column published_at : Time
    column slug : String
  end

  def word_count
    content.split(" ").reject { |word| word.empty? }.size
  end
end
