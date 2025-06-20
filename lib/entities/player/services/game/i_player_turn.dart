abstract interface class IPlayerTurn {
  int get currentBalls;
  int get randomBalls;
  int get enemyBalls;
  bool get whiteBall;
  bool get blackBall;

  bool get isScoreMove;
  bool get isWin;
  bool get isLose;
  bool get isErrorMove;
}
