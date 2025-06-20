import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/entity/match.dart';
import 'package:billiards/entities/match/repository/match_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final matchRepositoryProvider = Provider<IMatchRepository>((ref) {
  final store = ref.read(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<Match>(ref);
  return MatchRepository(repository);
});

abstract interface class IMatchRepository {
  Future<IMatch?> get(int id);
  Future<List<IMatch>> getAll();
  Future<int> add(IMatch match);
  Future<List<int>> addAll(List<IMatch> matches);
  Future<int> update(IMatch match);
  Future<bool> delete(int id);
  Future<int> clear();
}
