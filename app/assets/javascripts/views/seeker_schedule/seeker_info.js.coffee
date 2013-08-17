class padule.Views.SeekerInfo extends Backbone.View
  el: $ '.seeker-container'
  events:
    'change input#inputName' : '_setName'
    'change input#inputEmail' : '_setMail'
    'change input#inputEmail2' : '_setMail'
    'change textarea#inputComment' : '_setText'

  initialize: ->
    _.bindAll @

  _setName: (e)->
    @model.set 'name', $(e.currentTarget).val()

  _setMail: (e)->
    @model.set 'mail', $(e.currentTarget).val()

  _setText: (e)->
    @model.set 'text', $(e.currentTarget).val()