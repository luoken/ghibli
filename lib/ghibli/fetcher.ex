defmodule Ghibli.Fetcher do
  @moduledoc """
  Fetches the URL using `HTTPoison` and parses using `Jason` converting keys into atoms.
  """

  @base_url "https://ghibliapi.vercel.app/"

  @doc """
  Uses #{@base_url} as the base url and concats a query to the end. Ensures the `status_code`
  returns a 200 and parses it using returning a map with atom keys.

  ## Examples

      iex> Ghibli.Fetcher.fetch("films/5fdfb320-2a02-49a7-94ff-5ca418cae602")
      {:ok,
       %{
         id: "5fdfb320-2a02-49a7-94ff-5ca418cae602",
         description: "The film follows Anna Sasaki living with her relatives in the seaside town. Anna comes across a nearby abandoned mansion, where she meets Marnie, a mysterious girl who asks her to promise to keep their secrets from everyone. As the summer progresses, Anna spends more time with Marnie, and eventually Anna learns the truth about her family and foster care.",
         title: "When Marnie Was There",
         image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/vug1dvDI1tSa60Z8qjCuUE7ntkO.jpg",
         url: "https://ghibliapi.vercel.app/films/5fdfb320-2a02-49a7-94ff-5ca418cae602",
         species: ["https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"],
         people: ["https://ghibliapi.vercel.app/people/"],
         locations: ["https://ghibliapi.vercel.app/locations/"],
         vehicles: ["https://ghibliapi.vercel.app/vehicles/"],
         original_title: "思い出のマーニー",
         original_title_romanised: "Omoide no Marnie",
         movie_banner: "https://image.tmdb.org/t/p/original/axUX7urQDwCGQ9qbgh2Yys7qY9J.jpg",
         director: "Hiromasa Yonebayashi",
         producer: "Yoshiaki Nishimura",
         release_date: "2014",
         running_time: "103",
         rt_score: "92"
       }}
  """
  @spec fetch(query :: String.t()) :: {:ok, map()} | {:error, String.t()}
  def fetch(query) do
    with {:ok, %HTTPoison.Response{body: body, status_code: 200}} <-
           HTTPoison.get(@base_url <> query),
         {:ok, parsed} <- Jason.decode(body, keys: :atoms) do
      {:ok, parsed}
    else
      {:ok, response} -> {:error, inspect(response)}
      {:error, response} -> {:error, inspect(response)}
    end
  end
end
