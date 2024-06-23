# Phoenix Food Trucks API Documentation

## Overview

This API facilitates the management of food trucks by providing capabilities to create, update, delete, and retrieve detailed information about each food truck. It is designed to interact seamlessly with food truck data through a variety of endpoints.

## Prerequisites

Before you begin, ensure that the following tools are installed and properly set up:

- **Elixir**: The primary programming language used with the Phoenix framework. Installation instructions can be found at [Elixir's official website](https://elixir-lang.org/install.html).
- **Phoenix Framework**: A robust web framework for Elixir. Setup details are available at [Phoenix documentation](https://hexdocs.pm/phoenix/installation.html).
- **PostgreSQL**: The database system used to store food truck data. Installation guides are available at [PostgreSQL's official website](https://www.postgresql.org/download/).
- **Docker and Docker Compose** (optional): For running PostgreSQL in a containerized environment. Docker can be installed from [Docker's official site](https://www.docker.com/get-started) and Docker Compose from [Docker Compose documentation](https://docs.docker.com/compose/install/).

## Setup

1. **Clone the API repository**:
   ```bash
   git clone <repository-url>
   cd food-trucks-api

2. **Install dependencies**:
   ```bash
   mix deps.get

3. **Setup the database**:

   Create and migrate your database using

   ```bash
   mix ecto.setup

4. **Install Node.js dependencies:**:

   Navigate to the assets directory and run

   ```bash
   npm install

5. **Start the Phoenix server:**:

   Navigate to the assets directory and run

   ```bash
   mix phx.server

## API Endpoints

### Get API Description
- **Method:** GET
- **URL:** `/api`
- **Description:** Retrieve descriptions of all available endpoints.

### Get Food Trucks by Status
- **Method:** GET
- **URL:** `/api/food_trucks/status/:status`
- **Parameters:**
  - `:status` (required) - Status of the food trucks (e.g., active, inactive).

### Get All Food Trucks
- **Method:** GET
- **URL:** `/api/food_trucks/`

### Get Food Trucks by Fire Prevention District
- **Method:** GET
- **URL:** `/api/food_trucks/fireprevention/:district`
- **Parameters:**
  - `:district` (required) - The fire prevention district to filter food trucks by.
- **Description:** Retrieves food trucks that are located within a specified fire prevention district.

### Create a New Food Truck
- **Method:** POST
- **URL:** `/api/food_trucks/`
- **Body:** JSON payload containing food truck details.

### Update a Food Truck
- **Method:** PUT
- **URL:** `/api/food_trucks/:locationid`
- **Parameters:**
  - `:locationid` (required) - Unique identifier of the food truck.
- **Body:** JSON payload with updated food truck details.

### Delete a Food Truck
- **Method:** DELETE
- **URL:** `/api/food_trucks/:locationid`
- **Parameters:**
  - `:locationid` (required) - Unique identifier of the food truck to delete.
