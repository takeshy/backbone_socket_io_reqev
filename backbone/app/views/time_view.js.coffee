class Spa.TimeView extends Backbone.View
  template: JST["templates/time"]
  el: "<tr/>"

  render: ()->
    $(@el).html(@template(@model.toJSON()))
    @
