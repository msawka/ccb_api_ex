defmodule CcbApiEx.Model.Campus do
	
	defstruct id: nil,
		name: nil,
		active: nil,
		creator: nil,
		modifier: nil,
		created: nil

  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end
  end

	def from(map) do
    %CcbApiEx.Model.Campus{
      id: map[:id],
      name: map[:name],
      active: map[:active],
      creator: map[:creator],
      modifier: map[:modifier],
      created: map[:created],
    }
  end
end