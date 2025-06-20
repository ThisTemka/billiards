import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/managers/manipulate_game/i_turn.dart';
import 'package:riverpod/riverpod.dart';

final roundTurnStateProvider = StateProvider<RoundTurnState>((ref) {
  return RoundTurnState();
});

class RoundTurnState implements ITurn {
  final bool isLoading;

  final IPlayer? player;
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
  final bool tableExit;
  @override
  final bool touchBall;

  int get leftBalls => player!.leftBalls - selfBalls;
  int get selfBalls => currentBalls + randomBalls;

  bool get isError =>
      (whiteBall || tableExit || (!touchBall && selfBalls == 0));
  bool get isLoseMove => blackBall || (selfBalls == 0 && isError);
  bool get isErrorMove => !isLoseMove && isError;
  bool get isScoreMove => !isLoseMove && !isErrorMove && (selfBalls > 0);
  bool get isSimpleMove => !isLoseMove && !isErrorMove && !isScoreMove;
  bool get isWin => leftBalls == 0 && !isError;

  const RoundTurnState({
    this.isLoading = true,
    this.player,
    this.currentBalls = 0,
    this.randomBalls = 0,
    this.enemyBalls = 0,
    this.whiteBall = false,
    this.blackBall = false,
    this.tableExit = false,
    this.touchBall = true,
  });

  RoundTurnState copyWith({
    bool? isLoading,
    IPlayer? player,
    int? currentBalls,
    int? randomBalls,
    int? enemyBalls,
    bool? whiteBall,
    bool? blackBall,
    bool? tableExit,
    bool? touchBall,
  }) {
    return RoundTurnState(
      isLoading: isLoading ?? this.isLoading,
      player: player ?? this.player,
      currentBalls: currentBalls ?? this.currentBalls,
      randomBalls: randomBalls ?? this.randomBalls,
      enemyBalls: enemyBalls ?? this.enemyBalls,
      whiteBall: whiteBall ?? this.whiteBall,
      blackBall: blackBall ?? this.blackBall,
      tableExit: tableExit ?? this.tableExit,
      touchBall: touchBall ?? this.touchBall,
    );
  }
}
