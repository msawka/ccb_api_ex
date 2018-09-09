defmodule CcbApiEx.Parsers.Campus do

  import SweetXml
  
  def list(xml) do
    campuses = 
      xml
      |> xpath(
        ~x"//ccb_api/response/campuses/campus"l,
        id: ~x"./@id"i,
        name: ~x"./name/text()",
        active: ~x"./active/text()"i,
        creator: ~x"./creator/text()",
        modifier: ~x"./modifier/text()",
        created: ~x"./modifier/text()"
    )

    CcbApiEx.Model.Campus.from_list(campuses)
  end
end