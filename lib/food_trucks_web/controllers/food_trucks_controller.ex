defmodule FoodTrucksWeb.FoodTrucksController do
  use FoodTrucksWeb, :controller
  import Ecto.Query
  alias FoodTrucks.Repo
  alias FoodTrucksWeb.FoodTruck

  def index(conn, _params) do
    api_description = %{
      description: "This API provides endpoints to manage food trucks:",
      endpoints: [
        %{method: "GET", path: "/food_trucks/", description: "Get all food trucks"},
        %{
          method: "GET",
          path: "/food_trucks/:locationid",
          description: "Get details of a specific food truck"
        },
        %{
          method: "GET",
          path: "/food_trucks/fireprevention/:district",
          description: "Get food trucks with a specific status"
        },
        %{
          method: "GET",
          path: "/food_trucks/status/:status",
          description: "Get details of a specific food truck"
        },
        %{
          method: "DELETE",
          path: "/food_trucks/:locationid",
          description: "Delete a specific food truck"
        },
        %{method: "POST", path: "/food_trucks/", description: "Create a new food truck"},
        %{
          method: "PUT",
          path: "/food_trucks/:locationid",
          description: "Update a specific food truck"
        }
      ]
    }

    conn
    |> put_status(200)
    |> json(api_description)
  end

  def show_all(conn, _params) do
    food_trucks = Repo.all(FoodTruck)
    conn
    |> put_status(200)
    |> json(food_trucks)
  end

  def show(conn, %{"locationid" => locationid}) do
    case Repo.get_by(FoodTruck, locationid: locationid) do
      nil ->
        conn
        |> put_status(404)
        |> json(%{message: "Food truck not found"})

      food_truck ->
        conn
        |> put_status(200)
        |> json(food_truck)
    end
  end

  def fire_prevention(conn, %{"district" => district}) do
    query =
      from ft in FoodTrucksWeb.FoodTruck,
        where: ft.fire_prevention_districts == ^district,
        select: ft

    food_trucks = Repo.all(query)

    conn
    |> put_status(200)
    |> json(food_trucks)
  end

  def status(conn, %{"status" => status}) do
    status = String.upcase(status)

    query =
      from ft in FoodTrucksWeb.FoodTruck,
        where: ft.status == ^status,
        select: ft

    food_trucks = Repo.all(query)

    conn
    |> put_status(200)
    |> json(food_trucks)
  end

  def delete(conn, %{"locationid" => locationid}) do
    case Repo.get_by(FoodTruck, locationid: locationid) do
      nil ->
        conn
        |> put_status(404)
        |> json(%{message: "Food truck not found"})

      food_truck ->
        case Repo.delete(food_truck) do
          {:ok, _food_truck} ->
            conn
            |> put_status(200)
            |> json(%{message: "Food truck deleted successfully"})

          {:error, _changeset} ->
            conn
            |> put_status(500)
            |> json(%{message: "Failed to delete food truck"})
        end
    end
  end

  def create(conn, %{"food_truck" => food_truck_params}) do
    # Create a changeset from the params
    changeset = FoodTruck.changeset(%FoodTruck{}, food_truck_params)

    case Repo.insert(changeset) do
      {:ok, food_truck} ->
        conn
        |> put_status(201)
        |> json(%{message: "Food truck created successfully", food_truck: food_truck})

      {:error, changeset} ->
        errors = transform_errors(changeset.errors)

        conn
        |> put_status(422)
        |> json(%{message: "Failed to create food truck", errors: errors})
    end
  end

  def update(conn, %{"locationid" => locationid, "food_truck" => food_truck_params}) do
    case Repo.get_by(FoodTruck, locationid: locationid) do
      nil ->
        conn
        |> put_status(404)
        |> json(%{message: "Food truck not found"})

      food_truck ->
        changeset = FoodTruck.changeset(food_truck, food_truck_params)

        case Repo.update(changeset) do
          {:ok, _food_truck} ->
            conn
            |> put_status(200)
            |> json(%{message: "Food truck updated successfully"})

          {:error, changeset} ->
            errors = transform_errors(changeset.errors)

            conn
            |> put_status(404)
            |> json(%{message: "Failed to update food truck", errors: errors})
        end
    end
  end

  defp transform_errors(errors) do
    Enum.map(errors, fn {field, {message, _opts}} ->
      %{field: field, message: message}
    end)
  end
end
