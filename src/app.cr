require "./dependencies"
require "./models/base_model"
require "./models/mixins/**"
require "./models/**"
require "./queries/mixins/**"
require "./queries/**"
require "./forms/mixins/**"
require "./forms/**"
require "./actions/**"
require "./components/**"
require "./pages/**"
require "./serializers/**"
require "./handlers/**"
require "../config/env"
require "../config/**"
require "./middlewares"

Habitat.raise_if_missing_settings!
Lucky::AssetHelpers.load_manifest

class App < Lucky::BaseApp
  def middleware
    Blog.middlewares
  end
end
