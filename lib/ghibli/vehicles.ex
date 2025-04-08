defmodule Ghibli.Vehicles do
  @moduledoc """
  All logic surrounding getting location
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

  def all do
    Fetcher.fetch("vehicles")
    |> Enum.map(fn vehicle -> struct(__MODULE__, vehicle) end)
  end

  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("vehicles/#{id}"))
  end
end
