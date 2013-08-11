class padule.Views.AlertModal extends Backbone.View
  el: $ '#alertModal'

  events:
    'click #alertOK': ->
      @$el.modal 'hide'
      @model.trigger 'ignore_change'

  initialize: (options={})->
    @$el.find('.modal-title').html options.title
    @$el.find('.modal-body').html options.contents

  show: (model)->
    @model = model
    @$el.modal 'show'
