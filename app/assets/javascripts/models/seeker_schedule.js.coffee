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
    temp: 3

  initialize: (models, options={})->
    @seeker = new padule.Models.Seeker @get 'seeker', {seeker_schedule: @}
    @schedule = @collection?.schedule
    @changeEditable()
    @listenTo @, 'change:type', @changeEditable

  isConfirmed: ->
    @types.confirmed is @get 'type'

  isOK: ->
    @types.ok is @get 'type'

  isNG: ->
    @types.ng is @get 'type'

  isDefault: ->
    @types.default is @get 'type'

  isTemp: ->
    @types.temp is @get 'type'

  changeType: ->
    if @isOK() or @isConfirmed()
      @set 'type', @types.temp
    else if @isTemp()
      @set 'type', @types.ok

    editable = !@isTemp() and !@isConfirmed()
    @collection.changeEditable editable
    @changeEditableBySeeker false

  changeEditable: (editable)->
    if @isConfirmed() or @isTemp()
      @editable = true
    else if editable is undefined
      @editable = @isOK()
    else
      @editable = editable and !@isNG()
    @trigger 'afterChangeEditable'

  changeEditableBySeeker: (initial)->
    has_confirmed = false
    seeker_schedules = @collection.findBySeeker @
    _.each seeker_schedules, (seeker_schedule)=>
      if seeker_schedule.isConfirmed() or seeker_schedule.isTemp()
        has_confirmed = true

    # 初期表示時のみ
    _.each seeker_schedules, (seeker_schedule)=>
      if initial
        seeker_schedule.changeEditable !has_confirmed and seeker_schedule.editable
      else
        seeker_schedule.changeEditable !has_confirmed

  changeTypeBySeeker: ->
    if @isOK()
      @set 'type', @types.default
    else
      @set 'type', @types.ok
