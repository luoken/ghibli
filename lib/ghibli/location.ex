defmodule Ghibli.Location do
  @moduledoc """
  All logic surrounding getting location
  """

  alias Ghibli.Fetcher

  # "id": "11014596-71b0-4b3e-b8c0-1c4b15f28b9a",
  # "name": "Irontown",
  # "climate": "Continental",
  # "terrain": "Mountain",
  # "surface_water": "40",
  # "residents":

  # [

  #     "https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0"

  # ],
  # "films":

  #     [
  #         "https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"
  #     ],
  #     "url": "https://ghibliapi.vercel.app/locations/11014596-71b0-4b3e-b8c0-1c4b15f28b9a"

  # }

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

  def all do
    Fetcher.fetch("locations")
    |> Enum.map(fn location -> struct(__MODULE__, location) end)
  end

  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("locations/#{id}"))
  end
end
