class padule.Models.Schedule extends Backbone.Model
  urlRoot: '/schedules'
  localStorage: new Store "schedule"

  initialize: ->
    if @has 'seeker_schedules'
      @seeker_schedules = new padule.Collections.SeekerSchedules
        collection: @get('seeker_schedules')
        schedule: @
    else if @collection.first()?.has 'seeker_schedules'
      @seeker_schedules = @collection.first.seeker_schedules.clone().resetType()
    else
      @seeker_schedules = new padule.Collections.SeekerSchedules
        schedule: @
