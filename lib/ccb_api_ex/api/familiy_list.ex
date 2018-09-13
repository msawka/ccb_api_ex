defmodule CcbApiEx.Api.FamilyList do

  use CcbApiEx.Api.Base

  @srv "family_list"
	def list do
    with {:ok, body} <- get("srv=#{@srv}")
    do
      CcbApiEx.Parsers.FamilyList.list(body)
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end