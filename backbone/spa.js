//= require_self
//= require_tree ./templates
//= require_tree ./app
var Spa = {socket_io_url: "http://localhost:40000"};
Spa.appStart = function(){
  window.router = new Spa.SampleRouter();
  Backbone.history.start({pushState: true})
}
