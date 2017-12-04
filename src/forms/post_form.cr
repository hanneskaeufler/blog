class PostForm < Post::BaseForm
  allow title
  allow content

  def prepare
    published_at.value = Time.now
    validate_required title
    validate_required content
  end
end
