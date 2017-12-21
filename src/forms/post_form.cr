class PostForm < Post::BaseForm
  allow title
  allow content

  needs current_title : String, on: :update

  def prepare
    validate_uniqueness_of_title
    published_at.value = Time.now
    generate_slug
  end

  private def generate_slug
    slug.value = title.value.try do |value|
      value.downcase.gsub(" ", "-")
    end
  end

  private def validate_uniqueness_of_title
    return if title_didnt_change

    existing_posts_with_title = PostQuery.new.title(title.value).count > 0

    if existing_posts_with_title
      title.add_error "already exists"
    end
  end

  private def title_didnt_change
    current_title.try do |the_title|
      return title.value == the_title
    end
  end
end
