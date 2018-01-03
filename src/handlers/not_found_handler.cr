class NotFoundHandler
  include HTTP::Handler

  def call(context)
    params = Hash(String, String).new
    Blog::NotFound.new(context, params).perform_action
  end
end
