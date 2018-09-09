defmodule CcbApiEx.Model.EventProfile do
	
	defstruct id: nil,
		occurence: nil,
		did_not_meet: nil,
		head_count: nil,
		attendees: nil,
		topic: nil,
    notes: nil,
    prayer_requests: nil,
    info: nil,
    email_notification: nil,
    name: nil,
    description: nil,
    leader_notes: nil,
    start_datetime: nil,
    start_date: nil,
    start_time: nil,
    end_datetime: nil,
    end_date: nil,
    end_time: nil,
    timezone: nil,
    recurrence_description: nil,
    approval_status: nil,
    approval_status_id: nil,
    group: nil,
    group_id: nil,
    organizer: nil,
    organizer_id: nil,
    phone: nil,
    phone_type: nil,
    location_name: nil,
    location_street_address: nil,
    location_city: nil,
    location_state: nil,
    location_zip: nil,
    location_line_1: nil,
    location_line_2: nil,
    registration_limit: nil,
    registration_event_type: nil,
    registration_event_type_id: nil,
    event_grouping: nil,
    event_grouping_id: nil,
    creator: nil,
    creator_id: nil,
    modifier: nil,
    modifier_id: nil,
    listed: nil,
    public_calendar_listed: nil,
    image: nil,
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

    {:ok, start_datetime} = if map[:start_datetime] != nil do
      NaiveDateTime.from_iso8601("#{map[:start_datetime]}")
    else
      {:ok, map[:start_datetime]}
    end

    {:ok, end_datetime} = if map[:end_datetime] != nil do
      NaiveDateTime.from_iso8601("#{map[:end_datetime]}")
    else
      {:ok, map[:end_datetime]}
    end
    
    %CcbApiEx.Model.EventProfile{
      id: map[:id],
      occurence: map[:occurence],
      did_not_meet: map[:did_not_meet],
      head_count: map[:head_count],
      attendees: map[:attendees],
      topic: map[:topic],
      notes: map[:notes],
      prayer_requests: map[:prayer_requests],
      info: map[:info],
      email_notification: map[:email_notification],
      name: map[:name],
      description: map[:description],
      leader_notes: map[:leader_notes],
      start_datetime: start_datetime,
      start_date: map[:start_date],
      start_time: map[:start_time],
      end_datetime: end_datetime,
      end_date: map[:end_date],
      end_time: map[:end_time],
      timezone: map[:timezone],
      recurrence_description: map[:recurrence_description],
      approval_status: map[:approval_status],
      approval_status_id: map[:approval_status_id],
      group: map[:group],
      group_id: map[:group_id],
      organizer: map[:organizer],
      organizer_id: map[:organizer_id],
      phone: map[:phone],
      phone_type: map[:phone_type],
      location_name: map[:location_name],
      location_street_address: map[:location_street_address],
      location_city: map[:location_city],
      location_state: map[:location_state],
      location_zip: map[:location_state],
      location_line_1: map[:location_line_1],
      location_line_2: map[:location_line_2],
      registration_limit: map[:registration_limit],
      registration_event_type: map[:registration_event_type],
      registration_event_type_id: map[:registration_event_type_id],
      event_grouping: map[:event_grouping],
      event_grouping_id: map[:event_grouping_id],
      creator: map[:creator],
      creator_id: map[:creator_id],
      modifier: map[:modifier],
      modifier_id: map[:modifier_id],
      listed: map[:listed],
      public_calendar_listed: map[:public_calendar_listed],
      image: map[:image],
      created: created,
      modified: modified
    }
  end
end