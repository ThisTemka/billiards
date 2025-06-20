import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/player.dart';
import 'package:billiards/entities/player/repository/player_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final playerRepositoryProvider = Provider<IPlayerRepository>((ref) {
  final store = ref.read(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<Player>(ref);
  return PlayerRepository(repository);
});

abstract interface class IPlayerRepository {
  Future<IPlayer?> get(int id);
  Future<List<IPlayer>> getAll();
  Future<int> add(IPlayer entity);
  Future<List<int>> addAll(List<IPlayer> entities);
  Future<int> update(IPlayer entity);
  Future<bool> delete(int id);
  Future<int> clear();
}
