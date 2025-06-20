import 'package:billiards/entities/game_state/services/view/i_view_game_state_service.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/managers/view_game/i_view_game_manager.dart';
import 'package:riverpod/riverpod.dart';

class ViewGameManager implements IViewGameManager {
  final Ref ref;

  ViewGameManager(this.ref);

  IViewGameStateService get viewGameStateService =>
      ref.watch(viewGameStateServiceProvider);

  @override
  Future<IRound?> getCurrentRound() async {
    return await viewGameStateService.getCurrentRound();
  }

  @override
  Future<IMatch?> getCurrentMatch() async {
    return await viewGameStateService.getCurrentMatch();
  }

  @override
  Future<IPlayer?> getCurrentPlayer() async {
    return await viewGameStateService.getCurrentPlayer();
  }

  @override
  Future<bool> hasUnfinishedMatch() async {
    return await viewGameStateService.hasUnfinishedMatch();
  }

  @override
  Future<bool> hasCurrentPlayer() async {
    return await viewGameStateService.hasCurrentPlayer();
  }
}
