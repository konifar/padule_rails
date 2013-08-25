class padule.Views.ScheduleTbodyTh extends Backbone.View
  tagName: 'th'
  template: JST['templates/schedule_th']

  events:
    'click .schedule-delete-button' : 'deleteSchedule'

  initialize: ->
    _.bindAll @
    @start_time = padule.dateformatyyyyMMddWhhmm @model.get('start_time')

  render: ->
    @$el.html @template
      start_time: @start_time
    @

  deleteSchedule: (e)->
    e.preventDefault()
    padule.modal.render
      title: 'スケジュールを削除'
      contents: "『#{@start_time}』の日程を削除してよろしいですか？"
      callback: =>
        @model.destroy
          success: =>
            padule.info_area.render
              text: 'スケジュールを削除しました'
              class_name: 'label-info'
            @remove()
