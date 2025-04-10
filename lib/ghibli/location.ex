defmodule Ghibli.Location do
  @moduledoc """
  Houses the logic for fetching locations from the Studio Ghibli API. The shape of the
  data looks as follows:
  ```
  {
    "id": "11014596-71b0-4b3e-b8c0-1c4b15f28b9a",
    "name": "Irontown",
    "climate": "Continental",
    "terrain": "Mountain",
    "surface_water": "40",
    "residents": [
      "https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0"
    ],
    "films": [
      "https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"
    ],
    "url": "https://ghibliapi.vercel.app/locations/11014596-71b0-4b3e-b8c0-1c4b15f28b9a"
  }
  ```
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          climate: String.t(),
          terrain: String.t(),
          surface_water: String.t(),
          residents: [String.t()],
          films: [String.t()],
          url: String.t()
        }

  defstruct id: "",
            name: "",
            climate: "",
            terrain: "",
            surface_water: "",
            residents: [],
            films: [],
            url: ""

  @spec all :: {:ok, [__MODULE__.t()]} | {:error, String.t()}
  def all do
    Fetcher.fetch("locations")
    |> case do
      {:ok, locations} ->
        {:ok,
         Enum.map(locations, fn location -> struct(__MODULE__, sanitize_location(location)) end)}

      error ->
        error
    end
  end

  @spec get_by(id :: String.t()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def get_by(id) do
    Fetcher.fetch("locations/#{id}")
    |> case do
      {:ok, location} -> {:ok, struct(__MODULE__, sanitize_location(location))}
      error -> error
    end
  end

  @spec sanitize_location(map()) :: map()
  defp sanitize_location(%{climate: "TODO"} = location),
    do: sanitize_location(%{location | climate: ""})

  defp sanitize_location(%{terrain: "TODO"} = location),
    do: sanitize_location(%{location | terrain: ""})

  defp sanitize_location(%{residents: ["TODO"]} = location),
    do: sanitize_location(%{location | residents: []})

  defp sanitize_location(location), do: location
end
