class padule.Views.SeekerInfo extends Backbone.View
  el: $ '.seeker-container'
  events:
    'keypress #inputName' : 'set'

  initialize: ->
    _.bindAll @
