class Errors::Show < Lucky::ErrorAction
  def handle_error(error : Avram::RecordNotFoundError)
    context.response.status_code = 404
    render Blog::NotFoundPage
  end

  # This is the catch all method that renders unhandled exceptions
  def handle_error(error : Exception)
    Lucky.logger.error(unhandled_error: error.inspect_with_backtrace)

    if Lucky::ErrorHandler.settings.show_debug_output
      render_detailed_exception_page(error)
    else
      head status: 500
    end
  end

  private def render_detailed_exception_page(error)
    Lucky::ErrorHandler.render_exception_page(context, error)
  end
end
