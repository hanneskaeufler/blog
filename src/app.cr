require "./shards"
require "./app_database"
require "./models/base_model"
require "./models/**"
require "./queries/**"
require "./forms/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/**"
require "./serializers/**"
require "./handlers/**"
require "../config/env"
require "../config/**"
require "./middlewares"
require "./app_server"

Habitat.raise_if_missing_settings!
Lucky::AssetHelpers.load_manifest
