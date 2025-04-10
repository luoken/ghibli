defmodule Ghibli.People do
  @moduledoc """
  Handles fetching and parsing people endpoint from the Ghibli API. The data looks like this:
  ```
  {
    "id": "ba924631-068e-4436-b6de-f3283fa848f0",
    "name": "Cat King",
    "gender": "Male",
    "eye_color": "Emerald",
    "hair_color": "Grey",
    "films": [
      "https://ghibliapi.vercel.app/films/90b72513-afd4-4570-84de-a56c312fdf81"
    ],
    "species": "https://ghibliapi.vercel.app/species/603428ba-8a86-4b0b-a9f1-65df6abef3d3",
    "url": "https://ghibliapi.vercel.app/people/3042818d-a8bb-4cba-8180-c19249822d57"
  }
  ```
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

  @spec all :: {:ok, [__MODULE__.t()]} | {:error, String.t()}
  def all do
    Fetcher.fetch("people")
    |> case do
      {:ok, people} -> {:ok, Enum.map(people, fn person -> struct(__MODULE__, person) end)}
      error -> error
    end
  end

  @spec get_by(id :: String.t()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def get_by(id) do
    Fetcher.fetch("people/#{id}")
    |> case do
      {:ok, person} -> {:ok, struct(__MODULE__, person)}
      error -> error
    end
  end
end
