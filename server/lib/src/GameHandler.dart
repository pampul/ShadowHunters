part of server_library;

class GameHandler {

  int moves;
  int lastFirstTurn;
  bool hasWinner;
  List<Player> players;

  int gameStatus;

  GameHandler() {
    gameStatus = 0;
    moves;
    hasWinner;
  }

  Set<WebSocket> wsConnections= new Set<WebSocket>();
  onConnection(WebSocket conn) {
    // Server receives a message
    void onMessage(String message) {
      Map dataFromClient = JSON.decode(message);
      // Choosing an action accordingly to received command
      switch(dataFromClient["cmd"]){
        case "getMessage":
          print('Message received from the client : ${dataFromClient["arg"]}');

          // Sending the number to the client
          conn.add(JSON.encode({"cmd":"getMessage","arg": "Message '${dataFromClient["arg"]}' received !!"}));
          break;
      }
    }

    conn.listen(onMessage,
    onDone: (() {
      // Connection lost, removing
      if(wsConnections.contains(conn)) {
        wsConnections.remove(conn);
        _reset();
      }
    }),
    onError: (e) {
      // Connection lost, removing
      wsConnections.remove(conn);
      _reset();
    }
    );
  }

  void _reset() {
    // Resetting local data
    _sendToAll({"cmd":"reset"});
    players = null;
    wsConnections.clear();
  }

  void _sendToAll(Map message){
    // Sending a message to players
    wsConnections.forEach((WebSocket conn){
      conn.add(JSON.encode(message));
    });
  }

  void _start() {
    // Initial values:

  }

}