class padule.Models.SeekerSchedule extends Backbone.Model
  urlRoot: '/seeker_schedules'
  localStorage: new Store "seeker_schedule"

  defaults:
    type: -1

  types:
    default: -1
    ng: 0
    ok: 1
    confirmed: 2

  initialize: (models, options={})->
    @seeker = new padule.Models.Seeker @get 'seeker', {seeker_schedule: @}
    @schedule = @collection?.schedule

  isConfirmed: ->
    @types.confirmed is @get 'type'

  isOK: ->
    @types.ok is @get 'type'

  isNG: ->
    @types.ng is @get 'type'

  isDefault: ->
    @types.default is @get 'type'

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
