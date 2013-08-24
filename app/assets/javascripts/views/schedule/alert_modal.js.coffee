class padule.Views.AlertModal extends Backbone.View
  el: $ '#alertModal'

  events:
    'click #alertOK': ->
      @$el.modal 'hide'
      @callback()
      @

  render: (options={})->
    @$el.find('.modal-title').html options.title
    @$el.find('.modal-body').html options.contents
    @callback = options.callback
    @$el.modal 'show'