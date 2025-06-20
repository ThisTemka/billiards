import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/player/player_game_state_service.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:riverpod/riverpod.dart';

final playerGameStateServiceProvider =
    Provider.autoDispose<IPlayerGameStateService>((ref) {
  final repository = ref.read(gameStateRepositoryProvider);
  return PlayerGameStateService(ref, repository);
});

abstract interface class IPlayerGameStateService {
  Future<void> selectPlayer(IPlayer player);
}
