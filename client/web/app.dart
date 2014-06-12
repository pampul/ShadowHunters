import 'dart:html';
import 'package:ShadowHunters_Client/client_library.dart';

void main() {

  // Instantiating a new Game() class
  Game game = new Game();

  // Initializing WebSocket connection
  Connection conn = new Connection("ws://" + window.location.host + "/ws", game);

}