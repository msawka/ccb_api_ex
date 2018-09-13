defmodule CcbApiEx.Model.Address do
	
	defstruct address_type: nil,
		street_address: nil,
		city: nil,
		state: nil,
		zip: nil,
		country_code: nil,
    country: nil,
    line_1: nil,
    line_2: nil,
    latitude: nil,
    longitude: nil

  def from_list(nil), do: nil
  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end
  end

	def from(map) do
    %CcbApiEx.Model.Address{
      address_type: map[:address_type],
      street_address: map[:street_address],
      city: map[:city],
      state: map[:state],
      zip: map[:zip],
      country_code: map[:country_code],
      country: map[:country],
      line_1: map[:line_1],
      line_2: map[:line_2],
      latitude: map[:latitude],
      longitude: map[:longitude]
    }
  end
end