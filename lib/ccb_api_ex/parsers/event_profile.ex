defmodule CcbApiEx.Parsers.EventProfile do

  import SweetXml
  
  def list(xml) do
    events = 
      xml
      |> xpath(
        ~x"//ccb_api/response/events/event"l,
        id: ~x"./@id"i,
        occurence: ~x"./@occurrence",
        did_not_meet: ~x"./did_not_meet/text()",
        head_count: ~x"./head_count/text()",
        attendees: [
          ~x"./event/attendees/attendee"l,
          attendee_id: ~x"./@id"i,
        ],
        topic: ~x"./topic/text()",
        notes: ~x"./notes/text()",
        prayer_requests: ~x"./prayer_requests/text()",
        info: ~x"./info/text()",
        email_notification: ~x"./email_notification/text()",
        name: ~x"./name/text()",
        description: ~x"./description/text()",
        start_datetime: ~x"./start_datetime/text()",
        start_date: ~x"./start_date/text()",
        start_time: ~x"./start_time/text()",
        end_datetime: ~x"./end_datetime/text()",
        end_date: ~x"./end_date/text()",
        end_time: ~x"./end_time/text()",
        timezone: ~x"./timezone/text()",
        recurrence_description: ~x"./recurrence_description/text()",
        approval_status: ~x"./approval_status/text()",
        approval_status_id: ~x"./approval_status/@id"i,
        #exceptions ?
        group: ~x"./group/text()",
        group_id: ~x"./group/@id"i,
        organizer: ~x"./organizer/text()",
        organizer_id: ~x"./organizer/@id"i,
        phone: ~x"./phone/text()",
        phone_type: ~x"./phone/@type",
        location_name: ~x"./location/name/text()",
        location_street_address: ~x"./location/street_address/text()",
        location_city: ~x"./location/city/text()",
        location_state: ~x"./location/state/text()",
        location_zip: ~x"./location/zip/text()",
        location_line_1: ~x"./location/line_1/text()",
        location_line_2: ~x"./location/line_2/text()",
        registration_limit: ~x"./registration/limit/text()",
        registration_event_type: ~x"./registration/event_type/text()",
        registration_event_type_id: ~x"./registration/event_type/@id"i,
        #forms?
        #guest_list?
        #resources?
        #setup?
        event_grouping: ~x"./event_grouping/text()",
        event_grouping_id: ~x"./event_grouping/@id"i,
        creator: ~x"./creator/text()",
        creator_id: ~x"./creator/@id"i,
        modifier: ~x"./modifier/text()",
        modifier_id: ~x"./modifier/@id"i,
        listed: ~x"./listed/text()",
        public_calendar_listed: ~x"./public_calendar_listed/text()",
        image: ~x"./image/text()",
        created: ~x"./created/text()",
        modified: ~x"./modified/text()",
    )

    CcbApiEx.Model.EventProfile.from_list(events)
  end
end