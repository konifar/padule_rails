class padule.Views.ScheduleTheadTh extends Backbone.View
  tagName: 'th'

  initialize: ->
    _.bindAll @

  render: ->
    @$el.html @model.seeker.get 'name'
    @
