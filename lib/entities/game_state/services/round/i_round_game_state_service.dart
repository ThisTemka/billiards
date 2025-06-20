import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/round/round_game_state_service.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

final roundGameStateServiceProvider =
    Provider.autoDispose<IRoundGameStateService>((ref) {
  final repository = ref.read(gameStateRepositoryProvider);
  return RoundGameStateService(ref, repository);
});

abstract interface class IRoundGameStateService {
  Future<void> nextRound(IRound round);
  Future<void> endRound();
  Future<void> startRound(IRound round);
}
