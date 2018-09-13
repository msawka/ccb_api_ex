defmodule CcbApiEx.Model.Family do

  alias CcbApiEx.Model.Individual

  defstruct id: nil,
  	modified: nil,
  	individuals: nil

  def from_list(maps) do
    Enum.reduce maps, [], fn(map, result) ->
      result ++ [from(map)]
    end    
  end

  def from(map) do
    {:ok, modified} = if map[:modified] != nil do
      NaiveDateTime.from_iso8601("#{map[:modified]}")
    else
      {:ok, map[:modified]}
    end

    %CcbApiEx.Model.Family{
      id: map[:id],
      modified: modified,
      individuals: Individual.from_list(map[:individuals])
    }
  end
end