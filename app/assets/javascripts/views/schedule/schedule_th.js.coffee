class padule.Views.ScheduleTh extends Backbone.View
  tagName: 'th'

  initialize: (options={})->
    _.bindAll @
    @is_header = options.is_header

  render: ->
    if @is_header
      @$el.html @model.seeker.get 'name'
    else
      start_time = padule.dateformatyyyyMMddWhhmm @model.get('start_time')
      @$el.html start_time
    @
