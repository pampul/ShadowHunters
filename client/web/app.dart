import 'dart:html';
import 'package:ShadowHunters_Client/client_library.dart';
import 'package:google_oauth2_client/google_oauth2_browser.dart';

void main() {

  var signIn = new ButtonElement();
  signIn.text = "Sign in with Google";
  signIn.onClick.listen((e) {
    auth.login();
  });

  document.body.children.add(signIn);

  // Instantiating a new Game() class
  Game game = new Game();

  // Initializing WebSocket connection
  Connection conn = new Connection("ws://" + window.location.host + "/ws", game);

  submitMsg.onClick.listen((e) {
    conn.send({"cmd":"getMessage", "arg": inputElement.value});
  });

}

final auth = new GoogleOAuth2(
    "227440942862-g6auj4rmi0kbbn6arpina7ofjukn4qn4.apps.googleusercontent.com",
    ["openid", "email"],
    tokenLoaded:oauthReady);

void oauthReady(Token token) {
  print(token);
}