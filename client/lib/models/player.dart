part of client_library;

class Player {
  String email;
  int number;
  bool myTurn;
  int points;

  void _toggleTurn() {
    if (this.myTurn) {
      this.myTurn = false;
    } else {
      this.myTurn = true;
    }
  }

  void _reset() {
    email = null;
    number = null;
    points = null;
    myTurn = null;
  }
}