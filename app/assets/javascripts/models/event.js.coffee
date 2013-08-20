class padule.Models.Event extends Backbone.Model
  urlRoot: '/events'
  localStorage: new Store "event"
  parse: (resp)->
    if resp.responseText
      resp.responseText
    else
      resp

  defaults:
    title: ""
    url: "http://padule.me"
    text: ""
    enabled: true

  validate: (attrs)->
    if _.isEmpty attrs.title
      return "イベント名を入力してください。"
