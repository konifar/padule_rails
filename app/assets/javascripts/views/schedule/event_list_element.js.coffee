class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
    'click .delete-event-button' : 'deleteEvent'
    'click a' : 'showSchedule'
    'dblclick a' : 'editEvent'
    'keypress input[type=text]': 'updateOnEnter'

  initialize: (options = {})->
    _.bindAll @
    @listenTo @model, 'change', @render
    @listenTo @model, 'unactive', ->
      @$el.removeClass 'active'

  updateOnEnter: (e)->
    if e.keyCode is 13
      @close()

  editEvent: ->
    @$el.addClass 'editing'
    @input.focus()

  close: ->
    value = @input.val()
    if value
      @model.save {title: value},
        success: ->
          padule.info_area.render
            text: 'スケジュールを追加しました。'
            class_name: 'label-info'
      @$el.removeClass 'editing'

  render: ->
    @$el.html @template
      event: @model.toJSON()
    @input = @$('.edit')
    if @model.isNew()
      @$el.addClass('editing');
    @

  deleteEvent: (e)->
    e.preventDefault()
    padule.modal.render
      title: 'イベントを削除'
      contents: "『#{@model.get 'title'}』を削除してよろしいですか？"
      callback: =>
        @model.destroy
          success: ->
            padule.info_area.render
              text: 'イベントを削除しました'
              class_name: 'label-info'
            @remove()

  showSchedule: (e)->
    e.preventDefault()
    @model.collection.each (event)->
      event.trigger 'unactive'
    @$el.addClass 'active'

    new padule.Views.Schedule
      collection: new padule.Collections.Schedules false, _event: @model
