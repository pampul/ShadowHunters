part of server_library;

class Player{
  final String nickname;
  int points;
  bool myTurn;

  Player(this.nickname) {
    this.points = 0;
  }

  String _serialize() {
    return JSON.encode({
        "nickname" : this.nickname,
        "points" : this.points,
        "myTurn" : this.myTurn
    });
  }
}