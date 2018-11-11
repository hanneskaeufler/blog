Lucky::RouteHelper.configure do |settings|
  if Lucky::Env.production?
    # APP_DOMAIN must be set in heroku
    settings.base_uri = ENV.fetch("APP_DOMAIN")
  else
    settings.base_uri = "http://#{Lucky::ServerSettings.host}:#{Lucky::ServerSettings.port}"
  end
end
