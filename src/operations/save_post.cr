class SavePost < Post::SaveOperation
  permit_columns title, content

  needs current_title : String, on: :update

  before_save prepare

  def prepare
    set_uuid
    validate_required title
    validate_required content
    generate_slug
    validate_uniqueness_of_slug if title_changed_or_new_post
    published_at.value = Time.utc
  end

  private def generate_slug
    slug.value = title.value.try do |value|
      value.downcase.gsub(" ", "-").gsub(/[^\w-]/, "")
    end
  end

  private def validate_uniqueness_of_slug
    existing_posts_with_slug = PostQuery.new.slug(slug.value || "").select_count > 0

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