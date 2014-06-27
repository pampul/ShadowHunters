part of client_library;


@Controller(
  selector: '[game-controller]',
  publishAs: 'ctrl')
class GameController{
  final Http _http;
  final Scope _scope;
  final Router _router;

  GameController(this._scope, this._router){
    if(_scope.context['user-data'] == null){
      this._router.go('main', {});
    }else{
      _initGame();
    }
  }

  void _initGame(){



  }


}