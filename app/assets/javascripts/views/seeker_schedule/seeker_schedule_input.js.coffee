class padule.Views.SeekerScheduleInput extends Backbone.View
  el: $ '.seeker-schedule-container'

  events:
    'change input#inputName' : 'setName'
    'change input#inputEmail' : 'setMail'
    'change input#inputEmail2' : 'setMail'
    'change textarea#inputComment' : 'setText'
    'click #sendSeekerSchedule' : 'sendSeekerSchedule'

  initialize: (options={})->
    _.bindAll @
    @event = @collection.event
    @seeker = options.seeker

    @listenTo @event, 'sync', @render_event_info

    @event_container = @$('.event_container')
    @seeker_container = @$('.seeker-container')
    @control_container = @$('.control-container')

    new padule.Views.ScheduleList
      collection: @collection
      seeker: @seeker

    @collection.fetchByEvent()
    @event.fetch()

  render_event_info: ->
    @event_container.find('legend').html @event.get 'title'
    @event_container.find('.text').html @event.get 'text'

  sendSeekerSchedule: ->
    @seeker.save()
    @collection.each (schedule)->
      schedule.seeker_schedules.last().save()

  setName: (e)->
    @seeker.set 'name', $(e.currentTarget).val()

  setMail: (e)->
    @seeker.set 'mail', $(e.currentTarget).val()

  setText: (e)->
    @seeker.set 'text', $(e.currentTarget).val()