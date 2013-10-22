event_id = 1
$.mockjax
  url: "/seeker_schedules/1",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(1, 1, MockUtils.getSeeker(1, event_id))

$.mockjax
  url: "/seeker_schedules/2",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(2, 0, MockUtils.getSeeker(2, event_id))

$.mockjax
  url: "/seeker_schedules/3",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(3, 0, MockUtils.getSeeker(3, event_id))

$.mockjax
  url: "/seeker_schedules/4",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(4, 1, MockUtils.getSeeker(1, event_id))

$.mockjax
  url: "/seeker_schedules/5",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(5, 2, MockUtils.getSeeker(2, event_id))

$.mockjax
  url: "/seeker_schedules/6",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(6, 1, MockUtils.getSeeker(3, event_id))

$.mockjax
  url: "/seeker_schedules/7",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(7, 0, MockUtils.getSeeker(1, event_id))

$.mockjax
  url: "/seeker_schedules/8",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(8, 1, MockUtils.getSeeker(2, event_id))

$.mockjax
  url: "/seeker_schedules/9",
  responseText: JSON.stringify MockUtils.getSeekerSchedule(9, 1, MockUtils.getSeeker(3, event_id))
