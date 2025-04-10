defmodule Ghibli.Species do
  @moduledoc """
  Handles fetching and parsing Species endpoint from Studio Ghibli API.
  The data looks like this:
  ```
  {
   "id": "603428ba-8a86-4b0b-a9f1-65df6abef3d3",
   "name": "Cat",
   "classification": "Mammal",
   "eye_colors": "Brown, Black, Yellow, White, Emerald, Blue, Green",
   "hair_colors": "White, Black, Brown, Beige, Grey, Yellow",
   "people": [
     "https://ghibliapi.vercel.app/people/7151abc6-1a9e-4e6a-9711-ddb50ea572ec",
     "https://ghibliapi.vercel.app/people/f467e18e-3694-409f-bdb3-be891ade1106",
     "https://ghibliapi.vercel.app/people/89026b3a-abc4-4053-ab1a-c6d2eea68faa",
     "https://ghibliapi.vercel.app/people/6b3facea-ea33-47b1-96ce-3fc737b119b8",
     "https://ghibliapi.vercel.app/people/3042818d-a8bb-4cba-8180-c19249822d57",
     "https://ghibliapi.vercel.app/people/58d1973f-f247-47d7-9358-e56cb0d2b5a6",
     "https://ghibliapi.vercel.app/people/a3d8e70f-46a0-4e5a-b850-db01620d6b92",
     "https://ghibliapi.vercel.app/people/fc196c4f-0201-4ed2-9add-c6403f7c4d32",
     "https://ghibliapi.vercel.app/people/466bc926-2024-4653-ac63-fe52f2dc8c7b"
   ],
   "films": [
     "https://ghibliapi.vercel.app/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49",
     "https://ghibliapi.vercel.app/films/ea660b10-85c4-4ae3-8a5f-41cea3648e3e",
     "https://ghibliapi.vercel.app/films/ff24da26-a969-4f0e-ba1e-a122ead6c6e3",
     "https://ghibliapi.vercel.app/films/90b72513-afd4-4570-84de-a56c312fdf81",
     "https://ghibliapi.vercel.app/films/2de9426b-914a-4a06-a3a0-5e6d9d3886f6"
   ],
   "url": "https://ghibliapi.vercel.app/species/603428ba-8a86-4b0b-a9f1-65df6abef3d3"
  }
  ```
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          classification: String.t(),
          eye_colors: [String.t()],
          hair_colors: [String.t()],
          people: [String.t()],
          films: [String.t()],
          url: String.t()
        }

  defstruct id: "",
            classification: "",
            eye_colors: [],
            hair_colors: [],
            people: [],
            films: [],
            url: ""

  @spec all :: {:ok, [__MODULE__.t()]} | {:error, String.t()}
  def all do
    Fetcher.fetch("species")
    |> case do
      {:ok, species} ->
        {:ok,
         Enum.map(species, fn s ->
           struct(__MODULE__, s |> handle_eye_colors() |> handle_hair_colors())
         end)}

      error ->
        error
    end
  end

  @spec get_by(id :: String.t()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def get_by(id) do
    Fetcher.fetch("species/#{id}")
    |> case do
      {:ok, s} ->
        {:ok,
         struct(
           __MODULE__,
           s
           |> handle_eye_colors()
           |> handle_hair_colors()
         )}

      error ->
        error
    end
  end

  @spec handle_eye_colors(species :: map()) :: map()
  defp handle_eye_colors(species), do: %{species | eye_colors: string_to_list(species.eye_colors)}

  @spec handle_hair_colors(species :: map()) :: map()
  defp handle_hair_colors(species),
    do: %{species | hair_colors: string_to_list(species.hair_colors)}

  @spec string_to_list(string :: String.t()) :: [String.t()]
  defp string_to_list(string) do
    case String.contains?(string, ",") do
      true ->
        String.split(string, ", ")

      false ->
        [string]
    end
  end
end
