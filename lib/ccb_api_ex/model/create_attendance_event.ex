defmodule CcbApiEx.Model.CreateAttendanceEvent do
	
	defstruct event_id: nil,
    occurrence: nil,
		did_not_meet: false,
		attendee_ids: [],
    head_count: nil,
		topic: nil,
		notes: nil,
    prayer_requests: nil,
    info: nil,
    email_notification: "none"
end