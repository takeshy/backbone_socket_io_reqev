var express = require('express')
var Timer = require('./timer')
var path = require('path')
var http = require('http')

var app = express();

var Mincer  = require('mincer');
var environment = new Mincer.Environment();
environment.appendPath(__dirname + '/backbone');
app.use('/assets', Mincer.createServer(environment));

app.configure(function(){
  app.set('port', 40000);
  app.use(express.favicon());
  app.use(express.static(path.join(__dirname, 'public')));
});
app.get("/",function(req,res){
  res.sendfile('public/index.html');
});
app.get("/spa/*",function(req,res){
  res.sendfile('public/index.html');
});

var server = http.createServer(app);

server.listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});

var socketIO = require('socket.io');
var IOReqEv = require('socket.io-reqev');
var ioReqEv = new IOReqEv(socketIO.listen(server));
ioReqEv.register("/timer",new Timer());
