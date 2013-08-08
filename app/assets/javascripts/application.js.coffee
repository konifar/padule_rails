#= require libs/jquery-2.0.3.min
#= require libs/bootstrap.min
#= require libs/json2
#= require libs/jquery.mockjax
#= require libs/underscore
#= require libs/backbone
#= require padule
#= require_tree ./templates
#= require_tree ./mocks
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
# = require_tree ./routers

window.padule.initialize = ->
  new padule.Routers.Schedules
  if Backbone.history && !Backbone.History.started
    Backbone.history.start {pushState: true, hashChange: false}