import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/match/match_game_state_service.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:riverpod/riverpod.dart';

final matchGameStateServiceProvider =
    Provider.autoDispose<IMatchGameStateService>((ref) {
  final repository = ref.read(gameStateRepositoryProvider);
  return MatchGameStateService(ref, repository);
});

abstract interface class IMatchGameStateService {
  Future<void> startMatch(IMatch match);
  Future<void> endMatch();
  Future<void> nextMatch();
}
