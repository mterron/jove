function handleMsg(msg) {
  if (VISIBLE) {
    addData(msg.src, msg.dst);
  }
}


var wsUri = "ws://KBGY1CNW1D:8000/";

function init() {
  KBWebSocket();
}

function KBWebSocket() {
  websocket = new WebSocket(wsUri);
  websocket.onopen = function(evt) { onOpen(evt) };
  websocket.onclose = function(evt) { onClose(evt) };
  websocket.onmessage = function(evt) { onMessage(evt) };
  websocket.onerror = function(evt) { onError(evt) };
}

function onOpen(evt) {
      console.log('WebSocket CONNECTED');
}

function onClose(evt) {
      console.log('WebSocket DISCONNECTED');
      console.log('RECONNECTING...');
      setTimeout(KBWebSocket(),5000);
}

function onMessage(evt) {
  var logmsg = JSON && JSON.parse(evt.data);
//  console.log(logmsg);
  handleMsg(logmsg);
}

function onError(evt) {
      console.log('WebSocket ERROR');
}

window.addEventListener("load", init, false);


