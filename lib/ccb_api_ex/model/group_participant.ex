defmodule CcbApiEx.Model.GroupParticipant do
	
	defstruct id: nil,
    first_name: nil,
    last_name: nil,
    full_name: nil,
    email: nil,
    phones: nil

  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end
  end

	def from(map) do
    %CcbApiEx.Model.GroupParticipant{
      id: map[:id],
      first_name: map[:first_name],
      last_name: map[:last_name],
      full_name: map[:full_name],
      email: map[:email],
      phones: map[:phones]
    }
  end 
end