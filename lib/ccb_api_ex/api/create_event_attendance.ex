defmodule CcbApiEx.Api.CreateAttendanceEvent do

  use CcbApiEx.Api.Base

  @srv "create_event_attendance"
	def create(request) do
    attendees = Enum.reduce(request.attendee_ids, [], fn(id, attendees) -> 
      attendees ++ [{:attendee, %{id: id}, ""}]
    end)
    event_details = %{
      id: request.event_id
    }
    #event_details = if request.occurrence != nil do
      event_details = Map.put(event_details, :occurrence, "2018-07-30 19:00:00")
    #else
    #  event_details
    #end


    xml_request = XmlBuilder.document({:events, nil, [
      {:event, event_details, [
        {:did_not_meet,       nil, request.did_not_meet},
        {:head_count,         nil, request.head_count},
        {:attendees,          nil, attendees},
        {:topic,              nil, request.topic},
        {:notes,              nil, request.notes},
        {:prayer_requests,    nil, request.prayer_requests},
        {:info,               nil, request.notes},
        {:email_notification, nil, request.email_notification},
      ]}
    ]})

    with :ok <- post("srv=#{@srv}", xml_request)
    do
      Logger.debug("Successfully created attendance record")
    else
      {:error, reason} -> {:error, reason}
    end
    
	end
end