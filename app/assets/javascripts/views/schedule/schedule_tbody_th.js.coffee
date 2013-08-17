class padule.Views.ScheduleTbodyTh extends Backbone.View
  tagName: 'th'

  initialize: ->
    _.bindAll @

  render: ->
    start_time = padule.dateformatyyyyMMddWhhmm @model.get('start_time')
    @$el.html start_time
    @
