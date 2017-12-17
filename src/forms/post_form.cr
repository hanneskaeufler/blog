class PostForm < Post::BaseForm
  allow title
  allow content

  def prepare
    published_at.value = Time.now
    validate_required title
    validate_uniqueness_of_title
    validate_required content
  end

  private def validate_uniqueness_of_title
    existing_posts_with_title = PostQuery.new.title(title.value).count > 0

    if existing_posts_with_title
      title.add_error "already exists"
    end
  end
end
