class Errors::Show < Lucky::ErrorAction
  def handle_error(error : JSON::ParseException)
    if json?
      json({error: "There was a problem parsing the JSON. Please check that it is formed correctly"}, status: 400)
    else
      head status: 400
    end
  end

  def handle_error(error : LuckyRecord::RecordNotFoundError)
    context.response.status_code = 404
    render Blog::NotFoundPage
  end

  def handle_error(error : Exception)
    head status: 500
  end
end
