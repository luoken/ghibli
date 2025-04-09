defmodule Ghibli.People do
  @moduledoc """
  All logic surrounding getting people
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          gender: String.t(),
          age: String.t(),
          eye_color: String.t(),
          hair_color: String.t(),
          films: [String.t()],
          species: String.t(),
          url: String.t()
        }

  defstruct id: "",
            name: "",
            gender: "",
            age: "",
            eye_color: "",
            hair_color: "",
            films: [],
            species: "",
            url: ""

  @spec all() :: [__MODULE__.t()]
  def all do
    Fetcher.fetch("people")
    |> Enum.map(fn person -> struct(__MODULE__, person) end)
  end

  @spec get_by(id :: String.t()) :: __MODULE__.t()
  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("people/#{id}"))
  end
end
