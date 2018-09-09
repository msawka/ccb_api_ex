defmodule CcbApiEx.Api.GroupParticipants do

  use CcbApiEx.Api.Base

  @srv "group_participants"
	def show(id) do
    with {:ok, body} <- get("srv=#{@srv}&id=#{id}")
    do
      #CcbApiEx.Parsers.EventProfile.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end