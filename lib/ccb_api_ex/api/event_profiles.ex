defmodule CcbApiEx.Api.EventProfiles do

  use CcbApiEx.Api.Base

  @srv "event_profiles"
	def list do
    with {:ok, body} <- get("srv=#{@srv}")
    do
      CcbApiEx.Parsers.EventProfile.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end