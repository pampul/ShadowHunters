part of client_library;


@Controller(
  selector: '[game-controller]',
  publishAs: 'gameCtrl')
class GameController{
  final Http _http;
  final Scope _scope;
  final Router _router;
  WebSocketClientService _client;

  Map userData;
  Player player;
  Game game;
  List<Player> players;

  GameController(this._scope, this._router, this._client){
    userData = _scope.context['user-data'];

    if(userData == null){
      this._router.go('main', {});
    }else{
      _initGame();
    }
  }

  void _initGame(){

    // Create Player
    this.player  = new Player(userData.userId, userData.email, 0, 1);

    // Connect the client to the server
    _client.jsonMessageRequest('connectPlayer', userData, 'getGameState').then((_){
      this.player = new Player(_['currentPlayer']['id'], _['currentPlayer']['email'], _['currentPlayer']['points'], 0);
      this.game = new Game();
      this.players = createPlayers(_['game']['players']);
    });

  }

  List<Player> createPlayers(jsonPlayers){

    List<Player> playerList = new List();
    jsonPlayers.forEach((id, jsonPlayer){
      Player p = new Player(jsonPlayer['id'], jsonPlayer['email'], 1, 0);
      playerList.add(p);
    });

    return playerList;
  }


}