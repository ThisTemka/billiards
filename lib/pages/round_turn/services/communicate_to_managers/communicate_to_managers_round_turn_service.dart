import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/view_game/i_view_game_manager.dart';
import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/services/communicate_to_managers/i_communicate_to_managers_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersRoundTurnService
    implements ICommunicateToManagersRoundTurnService {
  final Ref _ref;

  CommunicateToManagersRoundTurnService(this._ref);

  IManipulateGameManager get manipulateGameManager =>
      _ref.read(manipulateGameManagerProvider);
  IViewGameManager get viewGameManager => _ref.watch(viewGameManagerProvider);

  @override
  Future<IPlayer> getCurrentPlayer() async {
    final player = await viewGameManager.getCurrentPlayer();
    return player!;
  }

  @override
  Future<void> completeTurn(RoundTurnState state) async {
    await manipulateGameManager.completeTurn(state);
  }

  @override
  Future<void> closeRound() async {
    await manipulateGameManager.closeRound();
  }

  @override
  Future<IRound> getCurrentRound() async {
    final round = await viewGameManager.getCurrentRound();
    return round!;
  }
}
