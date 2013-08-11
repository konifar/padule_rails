class padule.Collections.Events extends Backbone.Collection
  model: padule.Models.Event
  url: '/events'

  initialize: =>
    options =
      success: (result)=>
    @fetch options
