defmodule Ghibli.People do
  @moduledoc """
  All logic surrounding getting location
  """

  alias Ghibli.Fetcher

  # {

  #     "id": "ba924631-068e-4436-b6de-f3283fa848f0",
  #     "name": "Ashitaka",
  #     "gender": "male",
  #     "age": "late teens",
  #     "eye_color": "brown",
  #     "hair_color": "brown",
  #     "films":

  #     [],
  #     "species": "https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2",
  #     "url": "https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0"

  # },

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

  def all do
    Fetcher.fetch("people")
    |> Enum.map(fn person -> struct(__MODULE__, person) end)
  end

  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("people/#{id}"))
  end
end
