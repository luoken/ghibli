defmodule Ghibli.Species do
  @moduledoc """
  All logic surrounding getting location
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          classification: String.t(),
          eye_colors: String.t(),
          hair_colors: String.t(),
          people: [String.t()],
          films: [String.t()],
          url: String.t()
        }

  defstruct id: "",
            classification: "",
            eye_colors: "",
            hair_colors: "",
            people: [],
            films: [],
            url: ""

  def all do
    Fetcher.fetch("species")
    |> Enum.map(fn s -> struct(__MODULE__, s) end)
  end

  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("species/#{id}"))
  end
end
