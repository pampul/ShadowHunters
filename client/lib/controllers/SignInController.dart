part of client_library;


@Controller(selector: '[sign-in-controller]', publishAs: 'signInCtrl')
class SignInController {
  final Http _http;
  final Scope _scope;
  final Router _router;
  GoogleSignInService _googleSignInService;

  LinkElement signInElement = querySelector('#google-sign-in-button');

  SignInController(Scope scope) {


  }

  void signIn(){

    this._googleSignInService = new GoogleSignInService();
    this._googleSignInService.auth.login().then((Token token){
      print(token);
    });

  }
}
