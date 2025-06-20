import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/i_player_factory.dart';
import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/entities/player/services/game/i_game_service_service.dart';
import 'package:billiards/entities/player/services/game/i_player_turn.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

class GameServiceService implements IGameServiceService {
  final Ref ref;
  final IPlayerRepository repository;

  GameServiceService(this.ref, this.repository);

  IPlayerFactory get factory => ref.read(playerFactoryProvider);
  void update(IPlayer player) => repository.update(player);

  @override
  Future<List<IPlayer>> createPlayers(List<IUser> users) async {
    return users.map((user) => factory(user: user)).toList();
  }

  @override
  Future<void> turn(IPlayer player, IPlayerTurn turn) async {
    update(player.copyWith(
      leftBalls: player.leftBalls - turn.currentBalls + turn.randomBalls,
      randomBalls: player.randomBalls + turn.randomBalls,
      nullStartMoveTime: true,
      currentMoveInLine: turn.isScoreMove ? 0 : player.currentMoveInLine + 1,
      win: turn.isWin && !turn.isLose,
      moves: player.moves + 1,
      errorMoves: player.errorMoves + (turn.isErrorMove ? 1 : 0),
      moveDurations:
          player.moveDurations + [DateTime.now().difference(player.startMove!)],
      movesInLines: !turn.isScoreMove && player.currentMoveInLine != 0
          ? player.movesInLines + [player.currentMoveInLine]
          : player.movesInLines,
    ));
  }

  @override
  Future<void> turnForEnemy(IPlayer player, IPlayerTurn turn) async {
    update(player.copyWith(
      leftBalls: player.leftBalls - turn.enemyBalls,
      win: turn.isLose && !turn.isWin,
    ));
  }
}
