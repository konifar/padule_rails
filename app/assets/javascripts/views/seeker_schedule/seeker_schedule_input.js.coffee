class padule.Views.SeekerScheduleInput extends Backbone.View
  el: $ '.seeker-schedule-container'

  events:
    'keyup input#inputName' : 'setName'
    'keyup input#inputEmail' : 'setMail'
    'keyup input#inputEmail2' : 'setMail'
    'keyup textarea#inputComment' : 'setText'
    'click #sendSeekerSchedule' : 'sendSeekerSchedule'

  initialize: (options={})->
    _.bindAll @
    @event = @collection.event
    @seeker = options.seeker

    @listenTo @event, 'sync', @render_event_info
    @listenTo @seeker, 'change', @changeSendButtonEnable

    @event_container = @$ '.event-container'
    @seeker_container = @$ '.seeker-container'
    @control_container = @$ '.control-container'

    new padule.Views.ScheduleList
      collection: @collection
      seeker: @seeker

    @modal = new padule.Views.AlertModal

    @collection.fetchByEvent()
    @event.fetch()

  render_event_info: ->
    @event_container.find('h4').html @event.get 'title'
    @event_container.find('.text').html @event.get 'text'

  sendSeekerSchedule: ->
    @modal.render
      title: 'スケジュールを送信します'
      contents: 'よろしいですか？'
      callback: =>
        @seeker.set 'event_id', @event.id
        @seeker.save {},
          success: (seeker)=>
            @collection.each (schedule)=>
              schedule.seeker_schedules.last().set 'seeker_id', seeker.id
              schedule.seeker_schedules.last().save {},
                success: (seeker_schedule)=>
                  @afterSending()

  afterSending: ->
    @$('.necessary').attr 'disabled', true
    @$('#inputComment').attr 'disabled', true
    @$('.seeker-schedule-btn').addClass 'disabled'

    @control_container.find('#sendSeekerSchedule').removeClass('btn-success').addClass('btn-danger').addClass('disabled').html('送信しました')

  changeSendButtonEnable: ->
    if @seeker.hasNecessaryVal() and @checkMail()
      @control_container.find('#sendSeekerSchedule').removeClass 'disabled'
    else
      @control_container.find('#sendSeekerSchedule').addClass 'disabled'

  setName: (e)->
    @seeker.set 'name', $(e.currentTarget).val()

  setMail: (e)->
    @seeker.set 'mail', $(e.currentTarget).val()
    @checkMail()

  checkMail: ->
    if @$('#inputEmail').val() is @$('#inputEmail2').val()
      @$('.input-email2 > .important').html '(必須)'
      @$('.input-email2').removeClass 'has-error'
      @seeker.set 'mail', @$('#inputEmail').val()
      return true
    else
      @$('.input-email2 > .important').html 'メールアドレスが一致しません'
      @$('.input-email2').addClass 'has-error'
      return false

  setText: (e)->
    @seeker.set 'text', $(e.currentTarget).val()
