defmodule Ghibli.Film do
  @moduledoc """
  Logic for fetching Films from the Studio Ghibli API. The response is returned in this
  shape:
  ```
  {
    "id": "2baf70d1-42bb-4437-b551-e5fed5a87abe",
    "title": "Castle in the Sky",
    "original_title": "天空の城ラピュタ",
    "original_title_romanised": "Tenkū no shiro Rapyuta",
    "description": "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
    "director": "Hayao Miyazaki",
    "producer": "Isao Takahata",
    "release_date": "1986",
    "running_time": "124",
    "rt_score": "95",
    "people": [
      "https://ghibliapi.vercel.app/people/"
    ],
    "species": [
      "https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"
    ],
    "locations": [
      "https://ghibliapi.vercel.app/locations/"
    ],
    "vehicles": [
      "https://ghibliapi.vercel.app/vehicles/"
    ],
    "url": "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
  }
  ```
  """

  alias Ghibli.Fetcher

  @type t :: %__MODULE__{
          id: String.t(),
          description: String.t(),
          title: String.t(),
          image: String.t(),
          url: String.t(),
          original_title: String.t(),
          original_title_romanised: String.t(),
          movie_banner: String.t(),
          director: String.t(),
          producer: String.t(),
          release_date: String.t(),
          running_time: String.t(),
          rt_score: String.t(),
          people: [String.t()],
          species: [String.t()],
          locations: [String.t()],
          vehicles: [String.t()]
        }

  defstruct id: "",
            description: "",
            title: "",
            image: "",
            url: "",
            original_title: "",
            original_title_romanised: "",
            movie_banner: "",
            director: "",
            producer: "",
            release_date: "",
            running_time: "",
            rt_score: "",
            people: [],
            species: [],
            locations: [],
            vehicles: []

  @spec all :: {:ok, [__MODULE__.t()]} | {:error, String.t()}
  def all do
    Fetcher.fetch("films")
    |> case do
      {:ok, films} -> {:ok, Enum.map(films, fn film -> struct(__MODULE__, film) end)}
      error -> error
    end
  end

  @spec get_by(id :: String.t()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def get_by(id) do
    Fetcher.fetch("films/#{id}")
    |> case do
      {:ok, film} -> {:ok, struct(__MODULE__, film)}
      error -> error
    end
  end
end
