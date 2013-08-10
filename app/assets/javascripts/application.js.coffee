#= require libs/jquery-2.0.3.min
#= require libs/bootstrap.min
#= require libs/json2
#= require libs/jquery.mockjax
#= require libs/dateformat
#= require libs/underscore
#= require libs/backbone
#= require padule
#= require mocks/mock_utils
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

window.padule.dateformatyyyyMMddWhhmm = (string_date) ->
  if string_date is null
    return ""
  date_format = new DateFormat "yyyy-MM-dd HH:mm:ss"
  date = date_format.parse string_date
  y = date.getFullYear()
  m = date.getMonth()+1
  d = date.getDate()
  h = date.getHours()
  M = date.getMinutes()
  w = date.getDay()
  wNames = ['日', '月', '火', '水', '木', '金', '土']

  if m < 100
    m = '0' + m
  if d < 10
    d = '0' + d
  if h < 10
    h = '0' + h
  if M < 10
    M = '0' + M

  return y + "/" + m + "/" + d + "(" + wNames[w] + ") " + h + ":" + M;
