class padule.Collections.Events extends Backbone.Collection
  model: padule.Models.Event
  url: '/events'
  localStorage: new Store "event"
  parse: (resp)->
    if _.isArray(resp)
      resp
    else
      resp.responseText