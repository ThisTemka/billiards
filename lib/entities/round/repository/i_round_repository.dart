import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/round.dart';
import 'package:billiards/entities/round/repository/round_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final roundRepositoryProvider = Provider<IRoundRepository>((ref) {
  final store = ref.read(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<Round>(ref);
  return RoundRepository(repository);
});

abstract interface class IRoundRepository {
  Future<IRound?> get(int id);
  Future<List<IRound>> getAll();
  Future<int> add(IRound entity);
  Future<List<int>> addAll(List<IRound> entities);
  Future<int> update(IRound entity);
  Future<bool> delete(int id);
  Future<int> clear();
}
