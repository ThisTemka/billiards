import 'package:billiards/entities/player/services/game/i_player_turn.dart';
import 'package:billiards/entities/user/services/game/i_user_turn.dart';

class GameTurn implements IPlayerTurn, IUserTurn {
  @override
  final int currentBalls;
  @override
  final int randomBalls;
  @override
  final int enemyBalls;
  @override
  final bool whiteBall;
  @override
  final bool blackBall;

  @override
  final bool isScoreMove;
  @override
  final bool isErrorMove;
  @override
  final bool isLoseMove;
  @override
  final bool isSimpleMove;

  @override
  final bool isWin;
  @override
  final bool isLose;

  @override
  final Duration moveDuration;
  @override
  final int currentMoveInLine;

  GameTurn({
    required this.currentBalls,
    required this.randomBalls,
    required this.enemyBalls,
    required this.whiteBall,
    required this.blackBall,
    required this.isScoreMove,
    required this.isWin,
    required this.isLose,
    required this.isErrorMove,
    required this.isLoseMove,
    required this.isSimpleMove,
    required this.moveDuration,
    required this.currentMoveInLine,
  });
}
