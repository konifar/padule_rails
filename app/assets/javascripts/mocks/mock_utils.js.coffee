window.MockUtils ||= {}
MockUtils.getEvent = (id)->
  {
    "id": "#{id}",
    "title": "営業職#{id}次面接",
    "url": "/locks/add/xxxxxxxxxxxxxxxxxxx",
    "text": "営業職id次面接です。",
    "enabled": null
  }

MockUtils.getSeeker = (id, event_id)->
  {
    "id": id,
    "event_id": event_id,
    "name": "求職 太郎#{id}",
    "mail": "kyusyoku_#{id}@gmail.com",
    "comment": "よろしくお願いします！"
  }

MockUtils.getSeekerSchedule = (id, type, seeker)->
  {
    "id": id,
    "type": type,
    "seeker": seeker
  }

MockUtils.getSchedule = (id, event_id, start_time, end_time, seeker_schedules)->
  {
    "id": id,
    "event_id": event_id,
    "start_time": start_time,
    "end_time": end_time,
    "seeker_schedules": seeker_schedules
  }

MockUtils.getUser = (id)->
  {
    "id": id
    "name": "ユーザー#{id}"
  }

MockUtils.getSampleSchedules = (event_id)->
  schedules = []
  event_id = 1

  seeker_schedules1 = []
  seeker_schedules1.push MockUtils.getSeekerSchedule(1, 1, MockUtils.getSeeker(1, event_id))
  seeker_schedules1.push MockUtils.getSeekerSchedule(2, 0, MockUtils.getSeeker(2, event_id))
  seeker_schedules1.push MockUtils.getSeekerSchedule(3, 0, MockUtils.getSeeker(3, event_id))
  schedules.push MockUtils.getSchedule(1, event_id, "2013-07-01 10:00:00", "2013-07-01 10:30:00", seeker_schedules1)

  seeker_schedules2 = []
  seeker_schedules2.push MockUtils.getSeekerSchedule(4, 1, MockUtils.getSeeker(1, event_id))
  seeker_schedules2.push MockUtils.getSeekerSchedule(5, 2, MockUtils.getSeeker(2, event_id))
  seeker_schedules2.push MockUtils.getSeekerSchedule(6, 1, MockUtils.getSeeker(3, event_id))
  schedules.push MockUtils.getSchedule(2, event_id, "2013-07-02 16:00:00", "2013-07-02 16:30:00", seeker_schedules2)

  seeker_schedules3 = []
  seeker_schedules3.push MockUtils.getSeekerSchedule(7, 0, MockUtils.getSeeker(1, event_id))
  seeker_schedules3.push MockUtils.getSeekerSchedule(8, 1, MockUtils.getSeeker(2, event_id))
  seeker_schedules3.push MockUtils.getSeekerSchedule(9, 1, MockUtils.getSeeker(3, event_id))
  schedules.push MockUtils.getSchedule(3, event_id, "2013-07-03 12:00:00", "2013-07-03 12:30:00", seeker_schedules3)

  schedules