class padule.Models.Seeker extends Backbone.Model
  urlRoot: '/seekers'

  initialize: (options ={})->
    @seeker_schedule = options.seeker_schedule