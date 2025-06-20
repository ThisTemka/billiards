import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/player/i_player_game_state_service.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:riverpod/riverpod.dart';

class PlayerGameStateService implements IPlayerGameStateService {
  final Ref ref;
  final IGameStateRepository repository;

  PlayerGameStateService(this.ref, this.repository);

  Future<IGameState> get gameState async => await repository.get();
  Future<void> update(IGameState gameState) async =>
      await repository.update(gameState);

  @override
  Future<void> selectPlayer(IPlayer player) async {
    await update((await gameState).copyWith(
      currentPlayer: player,
    ));
  }
}
