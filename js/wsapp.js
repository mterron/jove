var app = require('http').createServer(handler)
var io = require('socket.io')(app);
var fs = require('fs');

app.listen(8000);

function handler (req, res) { };

io.on('connection', function (socket) {
	socket.emit('log', { hello: 'world1' });
  	socket.emit('log', { hello: 'world2' });
  	socket.emit('log', { hello: 'world3' });
  	socket.on('ping', function (data) { 
		console.log('ping')});
});
