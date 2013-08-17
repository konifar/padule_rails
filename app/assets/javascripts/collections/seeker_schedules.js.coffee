class padule.Collections.SeekerSchedules extends Backbone.Collection
  model: padule.Models.SeekerSchedule
  url: '/seeker_schedules'
  localStorage: new Store "seeker_schedules"

  initialize: (options)->
    @schedule = options.schedule

  resetType: ->
    @invoke 'set', {'type', '-1'}, {'silent', 'true'}

  findBySeeker: (seeker_schedule)->
    result = []
    @schedule.collection.each (schedule)->
      filters = schedule.seeker_schedules.filter (each)->
          each.seeker.get('name') is seeker_schedule.seeker.get('name') and each.id isnt seeker_schedule.id
      result = result.concat filters
    result
