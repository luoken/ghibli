defmodule Ghibli.Film do
  @moduledoc """
  All logic surrounding getting films
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

  @spec all() :: [__MODULE__.t()]
  def all do
    Fetcher.fetch("films")
    |> Enum.map(fn film -> struct(__MODULE__, film) end)
  end

  @spec get_by(id :: String.t()) :: __MODULE__.t()
  def get_by(id) do
    struct(__MODULE__, Fetcher.fetch("films/#{id}"))
  end
end
