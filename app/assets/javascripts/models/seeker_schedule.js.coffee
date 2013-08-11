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

  setCanEdit: (can_edit = true)->
    if !can_edit
      @set 'can_edit', false
    else if @isConfirmed() or @isNG()
      @set 'can_edit', false
    else
      @set 'can_edit', true

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
      can_edit = false
    else if @isTemp()
      @set 'type', @types.ok
      can_edit = true

    _.each @collection.findBySeeker(@), (seeker_schedule) ->
      seeker_schedule.setCanEdit(can_edit)