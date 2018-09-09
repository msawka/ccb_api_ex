defmodule CcbApiEx.Parsers.GroupProfile do

  import SweetXml
  
  def list(xml) do
    groups = 
      xml
      |> xpath(
        ~x"//ccb_api/response/groups/group"l,
        id: ~x"./@id",
        name: ~x"./name/text()",
        description: ~x"./description/text()",
        image: ~x"./image/text()",
        campus: ~x"./campus/text()",
        campus_id: ~x"./campus/@id",
        main_leader_id: ~x"./main_leader/@id",
        main_leader_first_name: ~x"./main_leader/first_name/text()",
        main_leader_last_name: ~x"./main_leader/last_name/text()",
        main_leader_full_name: ~x"./main_leader/full_name/text()",
        main_leader_email: ~x"./main_leader/email/text()",        
        main_leader_phones: [
          ~x"./main_leader/phones/phone"l,
          number: ~x"./text()",
        ],
        main_leader_phones_type: ~x"./main_leader/phones/@type",
        leaders: [
          ~x"./leaders/leader"l,
          id: ~x"./@id",
          first_name: ~x"./first_name/text()",
          last_name: ~x"./last_name/text()",
          full_name: ~x"./full_name/text()",
          email: ~x"./email/text()",
          status: ~x"./status/text()",
          phones: [
            ~x"./phones/phone"l,
            number: ~x"./text()",
          ],
          phones_type: ~x"./phones/@type",
        ],        
        participants: [
          ~x"./participants/participant"l,
          id: ~x"./@id",
          first_name: ~x"./first_name/text()"s,
          last_name: ~x"./last_name/text()"s,
          full_name: ~x"./full_name/text()"s,
          email: ~x"./email/text()"s,
          phones: [
            ~x"./phones/phone"l,
            number: ~x"./text()",
          ],
          phones_type: ~x"./phones/@type"s,
        ],
        group_type: ~x"./group_type/text()",
        group_type_id: ~x"./group_type/@id",
        department: ~x"./department/text()",
        department_id: ~x"./department/@id",
        area: ~x"./area/text()",
        area_id: ~x"./area/@id",
        calendar_feed: ~x"./calendar_feed/text()",
        # registration_forms ?
        current_members: ~x"./current_members/text()",
        group_capacity: ~x"./group_capacity/text()",
        # addresses ?
        meeting_day: ~x"./meeting_day/text()",
        meeting_day_id: ~x"./meeting_day/@id",
        meeting_time: ~x"./meeting_time/text()",
        meeting_time_id: ~x"./meeting_time/@id",   
        childcare_provided: ~x"./childcare_provided/text()",
        interaction_type: ~x"./interaction_type/text()",
        membership_type: ~x"./membership_type/text()",
        notification: ~x"./notification/text()",
        # user_defined_fields ?
        listed: ~x"./listed/text()",
        public_search_listed: ~x"./public_search_listed/text()",
        inactive: ~x"./inactive/text()",
        creator: ~x"./creator/text()",
        creator_id: ~x"./creator/@id",
        modifier: ~x"./modifier/text()",
        modifier_id: ~x"./modifier/@id",
        created: ~x"./created/text()",
        modified: ~x"./modified/text()"            
      )

    CcbApiEx.Model.GroupProfile.from_list(groups)
  end
end