events = []
for i in [1...5]
  events.push MockUtils.getEvent(i)

$.mockjax
  url: "/events"
  responseText: JSON.stringify events

$.mockjax
  url: "/events/1"
  responseText: JSON.stringify MockUtils.getEvent(1)

$.mockjax
  url: "/events/2"
  responseText: JSON.stringify MockUtils.getEvent(2)

$.mockjax
  url: "/events/3"
  responseText: JSON.stringify MockUtils.getEvent(3)