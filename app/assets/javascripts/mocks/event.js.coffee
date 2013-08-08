data = []
for i in [1...5]
  data.push({
    "id": i,
    "title": "営業職#{i}次面接",
    "url": "/events/show/#{i}",
    "text": "営業職#{i}次面接です。",
    "enabled": true
  })

$.mockjax({
    url: "/events",
    responseText: [data]
});
