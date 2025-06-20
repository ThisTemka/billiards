import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/game/i_game_user_service.dart';
import 'package:billiards/entities/user/services/game/i_user_turn.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameUserService implements IGameUserService {
  final Ref ref;
  final IUserRepository repository;

  GameUserService(this.ref, this.repository);

  Future<void> update(IUser user) => repository.update(user);

  @override
  Future<void> turn(IUser user, IUserTurn turn) async {
    await update(user.copyWith(
      currentBalls: user.currentBalls + turn.currentBalls,
      randomBalls: user.randomBalls + turn.randomBalls,
      enemyBalls: user.enemyBalls + turn.enemyBalls,
      whiteBalls: user.whiteBalls + (turn.whiteBall ? 1 : 0),
      blackBalls: user.blackBalls + (turn.blackBall ? 1 : 0),
      loseMoves: user.loseMoves + (turn.isLoseMove ? 1 : 0),
      errorMoves: user.errorMoves + (turn.isErrorMove ? 1 : 0),
      scoreMoves: user.scoreMoves + (turn.isScoreMove ? 1 : 0),
      simpleMoves: user.simpleMoves + (turn.isSimpleMove ? 1 : 0),
      rounds: user.rounds + (turn.isWin || turn.isLose ? 1 : 0),
      roundWins: user.roundWins + (turn.isWin && !turn.isLose ? 1 : 0),
      roundLoses: user.roundLoses + (turn.isLose && !turn.isWin ? 1 : 0),
      moves: user.moves + 1,
      moveDurations: user.moveDurations + [turn.moveDuration],
      movesInLines: !turn.isScoreMove && turn.currentMoveInLine != 0
          ? user.movesInLines + [turn.currentMoveInLine]
          : user.movesInLines,
    ));
  }

  @override
  Future<void> turnForEnemy(IUser user, IUserTurn turn) async {
    await update(user.copyWith(
      rounds: user.rounds + (turn.isWin || turn.isLose ? 1 : 0),
      roundWins: user.roundWins + (turn.isLose && !turn.isWin ? 1 : 0),
      roundLoses: user.roundLoses + (turn.isWin && !turn.isLose ? 1 : 0),
    ));
  }
}
