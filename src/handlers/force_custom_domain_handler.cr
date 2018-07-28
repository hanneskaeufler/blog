class ForceCustomDomainHandler
  include HTTP::Handler

  def call(context)
    if context.request.host =~ /herokuapp\.com/
      context.response.status_code = 301
      context.response.headers["Location"] = Lucky::RouteHelper.settings.base_uri
    else
      call_next(context)
    end
  end
end
