part of client_library;

class Player {
  String email;
  int userId;
  int number;
  int points;

  Player(int userId, String email, int points, int number){
    this.userId = userId;
    this.email = email;
    this.points = points;
    this.number = number;
  }

  void _reset() {
    userId = null;
    email = null;
    number = null;
    points = null;
  }
}