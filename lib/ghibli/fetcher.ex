defmodule Ghibli.Fetcher do
  @moduledoc """
  Does the fetching here
  """

  @base_url "https://ghibliapi.vercel.app/"

  def fetch(query, opts \\ []) do
    http_headers = Keyword.get(opts, :http_headers, [])
    http_opts = Keyword.get(opts, :http_opts, [])

    with {:ok, %HTTPoison.Response{body: body, status_code: 200}} <-
           HTTPoison.get(@base_url <> query, http_headers, http_opts),
         {:ok, parsed} <- Jason.decode(body, keys: :atoms) do
      parsed
    end
  end
end
