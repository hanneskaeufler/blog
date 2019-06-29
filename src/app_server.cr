class AppServer < Lucky::BaseAppServer
  def middleware
    Blog.middlewares
  end
end
