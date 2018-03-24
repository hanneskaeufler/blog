class Post < BaseModel

  private READING_SPEED = 200

  table :posts do
    column title : String
    column content : String
    column published_at : Time
    column slug : String
  end

  def word_count
    content.split(" ").reject(&.empty?).size
  end

  def reading_time
    return "less than a minute" if word_count < 200
    minutes = word_count / READING_SPEED

    "about #{minutes} min"
  end
end
