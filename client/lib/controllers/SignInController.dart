part of client_library;


@Controller(selector: '[sign-in-controller]', publishAs: 'signInCtrl')
class SignInController {
  final Http _http;
  final Scope _scope;
  final Router _router;
  GoogleSignInService _googleSignInService;
  WebSocketClientService _client;

  LinkElement signInElement = querySelector('#google-sign-in-button');

  SignInController(this._scope, this._client, this._router) {

  }

  void signIn(){

    this._googleSignInService = new GoogleSignInService();
    this._googleSignInService.auth.login().then((Token token){
      // Player signed in, let's send to server
      this.signInRequest(token);
    });

  }

  void signInRequest(token){

    _client.jsonMessageRequest('signIn', token, 'signIn').then((_){
      // TODO check if player can connect
      _client.disconnect();
      _router.go('game', {});
    });

  }
}
