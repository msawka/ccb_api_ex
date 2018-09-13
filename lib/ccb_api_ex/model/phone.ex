defmodule CcbApiEx.Model.Phone do
	
	defstruct phone_type: nil,
		phone: nil

  def from_list(nil), do: nil
  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end
  end

	def from(map) do
    %CcbApiEx.Model.Phone{
      phone_type: map[:phone_type],
      phone: map[:phone],
    }
  end
end