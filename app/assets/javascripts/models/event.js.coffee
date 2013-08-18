class padule.Models.Event extends Backbone.Model
  urlRoot: '/events'
  # localStorage: new Store "event"

  defaults:
    title: ""
    url: "http://padule.me/schedule"
    text: ""
    enabled: true

  validate: (attrs)->
    if _.isEmpty attrs.title
      return "イベント名を入力してください。"
