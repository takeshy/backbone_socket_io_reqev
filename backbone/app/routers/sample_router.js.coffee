class Spa.SampleRouter extends Backbone.Router
  initialize: (options)->
    @timers = new Spa.TimerCollection()

  routes:
    "spa/timers/:type": "timer"
    ".*": "timer"

  before: ()->
    @view.remove() if @view
    @view = null

  timer:(type)->
    @before()
    type ||= "current"
    @view = new Spa.TimerView(collection: @timers,type: type)
    $("#container").html(@view.render().el)
