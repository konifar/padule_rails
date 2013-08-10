events = []
for i in [1...5]
  events.push MockUtils.getEvent(i)

$.mockjax
  url: "/events"
  responseText: JSON.stringify events
