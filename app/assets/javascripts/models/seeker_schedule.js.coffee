class padule.Models.SeekerSchedule extends Backbone.Model
  urlRoot: '/seeker_schedules'
  localStorage: new Store "seeker_schedule"

  types:
    default: -1
    ng: 0
    ok: 1
    confirmed: 2

  initialize: ->
    @seeker = new padule.Models.Seeker @get 'seeker', {seeker_schedule: @}
    @schedule = @collection.schedule

  isConfirmed: ->
    @get 'type' is @types.confirmed

  isOK: ->
    @get 'type' is @types.ok

  isNG: ->
    @get 'type' is @types.ng

  isDefault: ->
    @get 'type' is @types.default

  changeType: ->
    if @isOK()
      @set 'type', @types.confirmed
    else if @isConfirmed()
      @set 'type', @types.ok

    @_changeEditable()

  _changeEditable: ->
    @collection.trigger 'changeEditable', @editable
    _.each @collection.findBySeeker @, (seeker_schedule) ->
      seeker_schedule.trigger 'changeEditable', editable

  editable: ->
    @get 'type' isnt @types.ng and @get 'type' isnt @types.confirmed

  changeTypeBySeeker: ->
    if @isOK()
      @set 'type', @types.default
    else
      @set 'type', @types.ok
