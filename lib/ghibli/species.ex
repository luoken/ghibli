defmodule Ghibli.Species do
  @moduledoc """
  All logic surrounding getting location
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

  @spec all() :: [__MODULE__.t()]
  def all do
    Fetcher.fetch("species")
    |> Enum.map(fn s -> struct(__MODULE__, s |> handle_eye_colors() |> handle_hair_colors()) end)
  end

  @spec get_by(id :: String.t()) :: __MODULE__.t()
  def get_by(id) do
    species =
      Fetcher.fetch("species/#{id}")
      |> handle_eye_colors()
      |> handle_hair_colors()

    struct(__MODULE__, species)
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
