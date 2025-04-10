defmodule Ghibli.Vehicles do
  @moduledoc """
  Fetches Vehicles from API. The response from the API looks like this:
  ```
  {
    "id": "923d70c9-8f15-4972-ad53-0128b261d628",
    "name": "Sosuke's Boat",
    "description": "A toy boat where Sosuke plays",
    "vehicle_class": "Boat",
    "length": "10",
    "pilot": "https://ghibliapi.vercel.app/people/a10f64f3-e0b6-4a94-bf30-87ad8bc51607",
    "films": [
      "https://ghibliapi.vercel.app/films/758bf02e-3122-46e0-884e-67cf83df1786"
    ],
    "url": "https://ghibliapi.vercel.app/films/758bf02e-3122-46e0-884e-67cf83df1786"
  }
  ```
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          description: String.t(),
          vehicle_class: String.t(),
          length: String.t(),
          pilot: String.t(),
          films: [String.t()],
          url: String.t()
        }

  defstruct id: "",
            name: "",
            description: "",
            vehicle_class: "",
            length: "",
            pilot: "",
            films: [],
            url: ""

  @spec all :: {:ok, [__MODULE__.t()]} | {:error, String.t()}
  def all do
    Fetcher.fetch("vehicles")
    |> case do
      {:ok, vehicles} -> {:ok, Enum.map(vehicles, fn vehicle -> struct(__MODULE__, vehicle) end)}
      error -> error
    end
  end

  @spec get_by(id :: String.t()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def get_by(id) do
    Fetcher.fetch("vehicles/#{id}")
    |> case do
      {:ok, vehicle} -> {:ok, struct(__MODULE__, vehicle)}
      error -> error
    end
  end
end
