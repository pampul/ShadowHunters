part of client_library;


@Controller(selector: '[sign-in-controller]', publishAs: 'signInCtrl')
class SignInController {
  final Http _http;
  final Scope _scope;
  final Router _router;
  GoogleSignInService _googleSignInService;
  StompClientService _client;

  LinkElement signInElement = querySelector('#google-sign-in-button');

  SignInController(this._scope, this._client) {

  }

  void signIn(){

    this._googleSignInService = new GoogleSignInService();
    this._googleSignInService.auth.login().then((Token token){
      // Player signed in, let's send to server
      this.signInRequest();
    });

  }

  void signInRequest(){

    this._client.connectWebsocket().then((_) {
      this._client.jsonMessage("/ws", JSON.encode({"cmd":"getMessage", "arg": "oui oui"}));
    });

  }
}
