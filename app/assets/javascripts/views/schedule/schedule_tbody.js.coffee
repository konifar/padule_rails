class padule.Views.ScheduleTbody extends Backbone.View
  tagName: 'tbody'

  initialize: ->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne

  renderOne: (schedule)->
    view = new padule.Views.ScheduleTbodyTr
      model: schedule
    @$el.append view.render().el

  render: ->
    @collection.each @renderOne
    @changeEditable()
    @

  changeEditable: ->
    if @collection.length > 0 and @collection.at(0).seeker_schedules.length > 0
      # 同じ求職者で未確定、確定済のものがある場合は編集不可
      @collection.at(0).seeker_schedules.changeEditableBySeeker()
