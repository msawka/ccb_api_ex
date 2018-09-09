defmodule CcbApiEx.Api.Campus do

  use CcbApiEx.Api.Base

  @srv "campus_list"
	def list do
    with {:ok, body} <- get("srv=#{@srv}")
    do
      CcbApiEx.Parsers.Campus.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end