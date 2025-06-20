import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/match/i_match_game_state_service.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:riverpod/riverpod.dart';

class MatchGameStateService implements IMatchGameStateService {
  final Ref ref;
  final IGameStateRepository repository;

  MatchGameStateService(this.ref, this.repository);

  Future<IGameState> get gameState async => await repository.get();
  Future<void> update(IGameState gameState) async =>
      await repository.update(gameState);

  @override
  Future<void> startMatch(IMatch match) async {
    await update((await gameState).copyWith(
      currentMatch: match,
      gameStatus: GameStatus.selectTurn,
    ));
  }

  @override
  Future<void> endMatch() async {
    await update((await gameState).copyWith(
      nullMatch: true,
      gameStatus: GameStatus.selectPlayer,
    ));
  }

  @override
  Future<void> nextMatch() async {
    await update((await gameState).copyWith(
      nullMatch: true,
      gameStatus: GameStatus.selectPlayer,
    ));
  }
}
