import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<int> seedGameStateRepository(Ref ref) async {
  final repository = ref.read(gameStateRepositoryProvider);
  final gameState = await repository.get();
  final updatedGameState = _update(gameState);
  return await repository.update(updatedGameState);
}

IGameState _update(IGameState gameState) => gameState.copyWith(
      currentMatch: null,
      currentRound: null,
      currentPlayer: null,
      gameStatus: GameStatus.selectPlayer,
    );
