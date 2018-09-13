defmodule CcbApiEx.Parsers.FamilyList do

  import SweetXml
  
  def list(xml) do
    families = 
      xml
      |> xpath(
        ~x"//ccb_api/response/families/family"l,
        id: ~x"./@id"i,
        modified: ~x"./modified/text()",
        individuals: [
          ~x"./individuals/individual"l,
          id: ~x"./@id"i,
	        first_name: ~x"./first_name/text()",
	        last_name: ~x"./last_name/text()",    
          type: ~x"./type/text()"
        ],        
    )

    CcbApiEx.Model.Family.from_list(families)
  end
end