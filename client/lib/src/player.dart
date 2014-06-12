part of client_library;

class Player {
  String nickname;
  int number;
  bool myTurn;
  int points;

  void _toggleTurn() {
    if(this.myTurn) {
      this.myTurn = false;
    } else {
      this.myTurn = true;
    }
  }

  void _reset() {
    nickname=null;
    number = null;
    points = null;
    myTurn = null;
  }
}