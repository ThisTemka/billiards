import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/view/view_game_state_service.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewGameStateServiceProvider =
    Provider.autoDispose<IViewGameStateService>((ref) {
  final repository = ref.watch(gameStateRepositoryProvider);
  return ViewGameStateService(ref, repository);
});

abstract interface class IViewGameStateService {
  Future<bool> hasUnfinishedMatch();
  Future<bool> hasCurrentPlayer();
  Future<IMatch?> getCurrentMatch();
  Future<IRound?> getCurrentRound();
  Future<IPlayer?> getCurrentPlayer();
}
