class PostForm < Post::BaseForm
  allow title, content
  allow_virtual published : Bool

  needs current_title : String, on: :update

  def prepare
    generate_slug
    validate_uniqueness_of_slug if title_changed_or_new_post
    validate_required published
    published_at.value = published.value ? Time.now : nil
  end

  private def generate_slug
    slug.value = title.value.try do |value|
      value.downcase.gsub(" ", "-")
    end
  end

  private def validate_uniqueness_of_slug
    existing_posts_with_slug = PostQuery.new.slug(slug.value || "").count > 0

    if existing_posts_with_slug
      title.add_error "already exists"
    end
  end

  private def title_changed_or_new_post
    current_title.try do |the_title|
      return title.value != the_title
    end
    true
  end
end
