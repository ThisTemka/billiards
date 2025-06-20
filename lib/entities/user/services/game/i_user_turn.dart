abstract interface class IUserTurn {
  int get currentBalls;
  int get randomBalls;
  int get enemyBalls;
  bool get whiteBall;
  bool get blackBall;
  bool get isLoseMove;
  bool get isErrorMove;
  bool get isScoreMove;
  bool get isSimpleMove;
  bool get isWin;
  bool get isLose;
  Duration get moveDuration;
  int get currentMoveInLine;
}
