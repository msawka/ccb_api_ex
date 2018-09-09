defmodule CcbApiEx.Api.GroupProfiles do

  use CcbApiEx.Api.Base

  @srv "group_profiles"
	def list do
    with {:ok, body} <- get("srv=#{@srv}")
    do
      CcbApiEx.Parsers.GroupProfile.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end