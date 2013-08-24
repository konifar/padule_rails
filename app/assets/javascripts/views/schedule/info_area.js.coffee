class padule.Views.InfoArea extends Backbone.View
  el: $ '.info-area'

  initialize: ->
    _.bindAll @

  render: (options={})->
    @$('.label').addClass(options.class_name).html options.text
    @$el.removeClass('show').addClass 'show'
    setTimeout =>
      @$el.removeClass 'show'
    , 4000
