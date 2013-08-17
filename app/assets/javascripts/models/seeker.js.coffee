class padule.Models.Seeker extends Backbone.Model
  urlRoot: '/seekers'
  localStorage: new Store "seeker"

  initialize: (options ={})->
    @seeker_schedule = options.seeker_schedule
