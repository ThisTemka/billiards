import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/services/view/i_view_game_state_service.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:riverpod/riverpod.dart';

class ViewGameStateService implements IViewGameStateService {
  final Ref ref;
  final IGameStateRepository repository;

  ViewGameStateService(this.ref, this.repository);

  Future<IGameState> get gameState async => await repository.get();

  @override
  Future<bool> hasUnfinishedMatch() async {
    return (await gameState).currentMatch != null;
  }

  @override
  Future<bool> hasCurrentPlayer() async {
    return (await gameState).currentPlayer != null;
  }

  @override
  Future<IMatch?> getCurrentMatch() async {
    return (await gameState).currentMatch!;
  }

  @override
  Future<IRound?> getCurrentRound() async {
    return (await gameState).currentRound!;
  }

  @override
  Future<IPlayer?> getCurrentPlayer() async {
    return (await gameState).currentPlayer!;
  }
}
