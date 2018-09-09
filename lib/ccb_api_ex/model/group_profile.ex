defmodule CcbApiEx.Model.GroupProfile do

  alias CcbApiEx.Model.GroupParticipant
    
    defstruct id: nil,
      name: nil,
      description: nil,
      image: nil,
      campus: nil,
      campus_id: nil,
      main_leader_id: nil,
      main_leader_first_name: nil,
      main_leader_last_name: nil,
      main_leader_full_name: nil,
      main_leader_email: nil,
      main_leader_phones: nil,
      main_leader_phones_type: nil,
      leaders: nil,
      participants: nil,
      group_type: nil,
      group_type_id: nil,
      department: nil,
      department_id: nil,
      area: nil,
      area_id: nil,
      calendar_feed: nil,
      current_members: nil,
      group_capacity: nil,
      meeting_day: nil,
      meeting_day_id: nil,
      meeting_time: nil,
      meeting_time_id: nil,
      childcare_provided: nil,
      interaction_type: nil,
      membership_type: nil,
      notification: nil,
      listed: nil,
      inactive: nil,
      creator: nil,
      creator_id: nil,
      modifier: nil,
      modifier_id: nil,
      created: nil,
      modified: nil


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

    {:ok, created} = if map[:created] != nil do
      NaiveDateTime.from_iso8601("#{map[:created]}")
    else
      {:ok, map[:created]}
    end

    participants = GroupParticipant.from_list(map[:participants])

    %CcbApiEx.Model.GroupProfile{
      id: map[:id],
      name: map[:name],
      description: map[:description],
      image: map[:image],
      campus: map[:campus],
      campus_id: map[:campus_id],
      main_leader_id: map[:main_leader_id],
      main_leader_first_name: map[:main_leader_first_name],
      main_leader_last_name: map[:main_leader_last_name],
      main_leader_full_name: map[:main_leader_full_name],
      main_leader_email: map[:main_leader_email],
      main_leader_phones: map[:main_leader_phones],
      main_leader_phones_type: map[:main_leader_phones_type],
      leaders: map[:leaders],
      participants: participants,
      group_type: map[:group_type],
      group_type_id: map[:group_type_id],
      department: map[:department],
      department_id: map[:department_id],
      area: map[:area],
      area_id: map[:area_id],
      calendar_feed: map[:calendar_feed],
      current_members: map[:current_members],
      group_capacity: map[:group_capacity],
      meeting_day: map[:meeting_day],
      meeting_day_id: map[:meeting_day_id],
      meeting_time: map[:meeting_time],
      meeting_time_id: map[:meeting_time_id],
      childcare_provided: map[:childcare_provided],
      interaction_type: map[:interaction_type],
      membership_type: map[:membership_type],
      notification: map[:notification],
      listed: map[:listed],
      inactive: map[:inactive],
      creator: map[:creator],
      creator_id: map[:creator_id],
      modifier: map[:modifier],
      modifier_id: map[:modifier_id],
      created: created,
      modified: modified
    }
  end
end