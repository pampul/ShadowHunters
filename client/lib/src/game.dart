part of client_library;

class Game {
  Player me;
  Player opponent;
  Set<int> occupiedCells;

  Game() {
    this.me = new Player();
    this.opponent = new Player();
    this.occupiedCells = new Set<int>();
  }
}