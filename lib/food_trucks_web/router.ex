defmodule FoodTrucksWeb.Router do
  use FoodTrucksWeb, :router

  pipeline :browser do
    plug :fetch_session
    plug :accepts, ["html"]
    plug :fetch_flash
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
  end

  scope "/", FoodTrucksWeb do
    pipe_through :browser

    get "/", FoodTrucksController, :index
    get "/food_trucks/", FoodTrucksController, :show_all
    get "/food_trucks/:locationid", FoodTrucksController, :show
    get "/food_trucks/fireprevention/:district", FoodTrucksController, :fire_prevention
    get "/food_trucks/status/:status", FoodTrucksController, :status
    delete "/food_trucks/:locationid", FoodTrucksController, :delete
    post "/food_trucks/", FoodTrucksController, :create
    put "/food_trucks/:locationid", FoodTrucksController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", FoodTrucksWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: FoodTrucksWeb.Telemetry
    end
  end
end
