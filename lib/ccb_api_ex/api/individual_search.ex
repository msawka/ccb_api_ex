defmodule CcbApiEx.Api.IndividualSearch do

  use CcbApiEx.Api.Base

  @srv "individual_search"
	def search(params) do
    query_string = Enum.reduce Map.keys(params), "", fn(key, query_string) ->
      query_string = if String.length(query_string) == 0 do
        query_string
      else
        "#{query_string}&"
      end

      "#{query_string}#{key}=#{params[key]}"
    end

    with {:ok, body} <- get("srv=#{@srv}&#{query_string}")
    do
      CcbApiEx.Parsers.IndividualSearch.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end