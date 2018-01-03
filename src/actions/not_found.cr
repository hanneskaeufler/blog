class Blog::NotFound < BrowserAction
  def call
    view = Blog::NotFoundPage.new(context)
    Lucky::Response.new(
      context: context,
      content_type: "text/html",
      body: view.perform_render.to_s,
      status: Lucky::Action::Status::NotFound.value
    )
  end
end
