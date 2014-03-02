var events = require('events');
var Timer = function(){
  this.events = ["five","ten","thirty"];
  var that = this;
  setInterval(function (){
    var now = new Date();
    if(now.getSeconds() % 5 == 0){
      that.emit("five", {id: "five",time: now.toString()});
    }
    if(now.getSeconds() % 10 == 0){
      that.emit("ten", {id: "ten",time: now.toString()});
    }
    if(now.getSeconds() % 30 == 0){
      that.emit("thirty", {id: "thirty",time: now.toString()});
    }
  },1000);
  return this;
}
Timer.prototype = new events.EventEmitter();
Timer.prototype.request = function(req,cb){
  if(req=="current"){
    cb(null,{id:"current", time: new Date().toString()});
  }
}
module.exports = Timer;
