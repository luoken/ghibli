defmodule Ghibli.Location do
  @moduledoc """
  All logic surrounding getting location
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

  @spec all() :: [__MODULE__.t()]
  def all do
    Fetcher.fetch("locations")
    |> Enum.map(fn location -> struct(__MODULE__, sanitize_location(location)) end)
  end

  @spec get_by(id :: String.t()) :: __MODULE__.t()
  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("locations/#{id}"))
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
