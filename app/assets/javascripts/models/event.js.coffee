class padule.Models.Event extends Backbone.Model
  urlRoot: '/events'
  localStorage: new Store "event"

  add: ->
    options =
      type: 'POST'
      data:
        title: @get 'title'
        text: ""
        enabled: true
    Backbone.sync 'create', @, options
