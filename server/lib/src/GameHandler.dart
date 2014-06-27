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
        case "signIn":
          // Sending the number to the client
          conn.add(JSON.encode({"cmd":"signIn","arg": "Message '${dataFromClient["arg"]}' received !!"}));
          break;

        case "connectPlayer":
          print('connect');
          print(dataFromClient["arg"]);
          conn.add(JSON.encode({"cmd":"getGameState","arg": {"currentPlayer": {"id": "12", "email": "florian.mithieux@gmail.com", "points": "12"}, "game":{"players": {"12": {"id": "12", "email": "florian.mithieux@gmail.com"}, "11": {"id": "11", "email": "ouioui@gmail.com"}}}}}));

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

  void getGameDataForPlayer(clientData){

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