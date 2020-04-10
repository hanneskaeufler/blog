class AppServer < Lucky::BaseAppServer
  def middleware : Array(HTTP::Handler)
    Blog.middlewares
  end
end
