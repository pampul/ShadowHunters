part of client_library;


@Controller(selector: '[main-controller]', publishAs: 'ctrl')
class MainController {
  final Http _http;
  final Scope _scope;
  final Router _router;
  Map _userData;

  MainController(this._scope, this._router) {

    Stream stream = this._scope.on('user-signed-in');
    stream.listen(userLoggedIn);

  }


  void userLoggedIn(ScopeEvent e) {

    this._userData = e.data;

    _scope.context['user-data'] = e.data;
    this._router.go('game', {});

  }

}