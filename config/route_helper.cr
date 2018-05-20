Lucky::RouteHelper.configure do
  if Lucky::Env.production?
    settings.base_uri = ENV.fetch("APP_DOMAIN")
  else
    settings.base_uri = "http://#{Lucky::ServerSettings.host}:#{Lucky::ServerSettings.port}"
  end
end
