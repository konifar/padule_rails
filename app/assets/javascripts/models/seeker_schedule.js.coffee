class padule.Models.SeekerSchedule extends Backbone.Model
  urlRoot: '/seeker_schedules/show'

  types:
    ng: 0
    ok: 1
    confirmed: 2
    temp: 3

  initialize: ->
    @seeker = new padule.Models.Seeker @get 'seeker', {seeker_schedule: @}
    @setCanEdit()

  setCanEdit: ->
    if @isConfirmed()
      @can_edit = false
      @collection.can_edit = false

  isConfirmed: ->
    @get('type') is @types.confirmed

  isOK: ->
    @get('type') is @types.ok

  isNG: ->
    @get('type') is @types.ng

  isTemp: ->
    @get('type') is @types.temp

  changeType: ->
    if @isOK()
      @set 'type', @types.temp
    else if @isTemp()
      @set 'type', @types.ok