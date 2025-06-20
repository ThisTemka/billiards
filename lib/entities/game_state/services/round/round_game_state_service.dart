import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/round/i_round_game_state_service.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

class RoundGameStateService implements IRoundGameStateService {
  final Ref ref;
  final IGameStateRepository repository;

  RoundGameStateService(this.ref, this.repository);

  Future<IGameState> get gameState async => await repository.get();
  Future<void> update(IGameState gameState) async =>
      await repository.update(gameState);

  @override
  Future<void> nextRound(IRound round) async {
    await _startRound(round);
  }

  @override
  Future<void> endRound() async {
    await update((await gameState).copyWith(
      nullRound: true,
      gameStatus: GameStatus.selectTurn,
    ));
  }

  Future<void> _startRound(IRound round) async {
    await update((await gameState).copyWith(
      currentRound: round,
      gameStatus: GameStatus.selectTurn,
    ));
  }

  @override
  Future<void> startRound(IRound round) async {
    await update((await gameState).copyWith(
      currentRound: round,
      gameStatus: GameStatus.selectTurn,
    ));
  }
}
