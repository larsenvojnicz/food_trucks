# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :food_trucks,
  ecto_repos: [FoodTrucks.Repo]

# Configures the endpoint
config :food_trucks, FoodTrucksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+6kf+aHATmfGgsVkzNa3E0W4BG1z/9cehJJLuhftwy3mhXzm1aevyeI+84ekg9Re",
  render_errors: [view: FoodTrucksWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FoodTrucks.PubSub,
  live_view: [signing_salt: "n98eGRO8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
