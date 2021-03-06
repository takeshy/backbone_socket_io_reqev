class Spa.TimerView extends Backbone.View
  template: JST["templates/timer"]

  events:
    "click a": "changeTimer"

  initialize: (options)->
    @childViews = []
    @type = options.type
    @collection.watch(@type)
    @model = @collection.get(@type)
    @listenTo(@model,'change', @updateTimer)

  changeTimer: (e)->
    e.preventDefault()
    e.stopPropagation()
    router.navigate($(e.currentTarget).attr("href"), {trigger: true})

  updateTimer: ()->
    view = new Spa.TimeView(model: @model)
    @$("#timerList").append(view.render().el)
    @childViews.push(view)

  render: ()->
    $(@el).html(@template(type: @type))
    @

  remove: ()->
    for v in @childViews
      v.remove()
    @collection.unwatch()
    super()

