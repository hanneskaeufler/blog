class Errors::Show < Lucky::ErrorAction
  def handle_error(error : LuckyRecord::RecordNotFoundError)
    context.response.status_code = 404
    render Blog::NotFoundPage
  end

  def handle_error(error : Exception)
    head status: 500
  end
end
