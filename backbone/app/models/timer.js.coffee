class Spa.Timer extends Backbone.Model

class Spa.TimerCollection extends Backbone.Collection
  model: Spa.Timer
  socket: null
  @types: ["current","five","ten","thirty"]

  initialize: ()->
    @add(_.map(Spa.TimerCollection.types,(type)-> new Spa.Timer(id: type)))
    @socket = new IOReqEvClient(Spa.socket_io_url + "/timer", (obj)=> @update(obj))

  update: (obj)->
    @add(obj,merge: true)

  watch: (id)->
    return if !id || !@get(id)
    @get(id).unset("time")
    param = if id == "current" then {requests: id} else {events: id}
    @socket.watch(param)

  unwatch: ()->
    @socket.unwatch()

