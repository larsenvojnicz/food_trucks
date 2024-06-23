defmodule FoodTrucksWeb.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  # Set locationid as primary key
  @primary_key {:locationid, :integer, autogenerate: false}
  schema "mobile_food_facility_permit" do
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :cnn, :integer
    field :received, :integer
    field :prior_permit, :integer
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :integer
    field :neighborhoods, :integer
    field :applicant, :string
    field :location_description, :string
    field :schedule, :string
    field :facility_type, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :dayshours, :string
    field :noi_sent, :string
    field :approved, :string
    field :expiration_date, :string
    field :location, :string
    field :food_items, :string
  end

  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :block,
      :status,
      :address,
      :location,
      :permit,
      :approved,
      :y,
      :x,
      :locationid,
      :applicant,
      :latitude,
      :longitude,
      :cnn,
      :received,
      :prior_permit,
      :fire_prevention_districts,
      :police_districts,
      :supervisor_districts,
      :zip_codes,
      :neighborhoods,
      :location_description,
      :schedule,
      :facility_type,
      :blocklot,
      :lot,
      :dayshours,
      :noi_sent,
      :expiration_date,
      :food_items
    ])
    |> validate_required([:locationid, :applicant])
    |> unique_constraint(:locationid, name: :unique_constraint_name)
  end
end
