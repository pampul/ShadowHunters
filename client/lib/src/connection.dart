part of client_library;

class Connection {

  WebSocket ws;
  String url;
  Game game;

  Connection(this.url, this.game) {
    _init();
  }

  void _init() {
    ws = new WebSocket(this.url);
    ws.onOpen.listen((e){
      // Connection established
    });

    ws.onClose.listen((e){
      // Server connection lost
    });

    ws.onMessage.listen((e){
      // Client receives a message from server
      Map dataFromServer = JSON.decode(e.data);
      // Choosing an action accordingly to command sent by server
      switch(dataFromServer["cmd"]) {
        case "getMessage":
          print('Message received from server : ${dataFromServer["arg"]}');
          break;
      }
    });
  }


  void send(Map message) {
    // Sends stringified map-based message to server
    ws.send(JSON.encode(message));
  }
}