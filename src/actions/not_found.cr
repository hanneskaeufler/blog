class Blog::NotFound < BrowserAction
  def call
    view = Blog::NotFoundPage.new(context)
    Lucky::TextResponse.new(
      context: context,
      content_type: "text/html",
      body: view.perform_render.to_s,
      status: HTTP::Status::NOT_FOUND.value
    )
  end
end
