import 'package:billiards/entities/game_state/entity/game_state.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/game_state_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final toolingGameStateRepositoryProvider =
    Provider.autoDispose<IToolingGameStateRepository>((ref) {
  final store = ref.read(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<GameState>(ref);
  return GameStateRepository(repository);
});

abstract interface class IToolingGameStateRepository {
  Future<bool> has();
  Future<int> add(IGameState gameState);
  Future<void> reset();
}
