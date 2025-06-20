import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/services/view/view_match_service.dart';
import 'package:riverpod/riverpod.dart';

final viewMatchServiceProvider = Provider.autoDispose<IViewMatchService>((ref) {
  final repository = ref.watch(matchRepositoryProvider);
  return ViewMatchService(repository);
});

abstract interface class IViewMatchService {
  Future<List<IMatch>> getSortedMatches();
}
