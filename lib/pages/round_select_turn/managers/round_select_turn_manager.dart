import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_select_turn/entities/state/services/manipulate/i_manipulate_state_round_select_turn_service.dart';
import 'package:billiards/pages/round_select_turn/managers/i_round_select_turn_manager.dart';
import 'package:billiards/pages/round_select_turn/services/communicate_to_managers/i_communicate_to_managers_round_select_turn_service.dart';
import 'package:billiards/pages/round_select_turn/services/route/i_route_round_select_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundSelectTurnManager implements IRoundSelectTurnManager {
  final Ref ref;

  RoundSelectTurnManager(this.ref);

  ICommunicateToManagersRoundSelectTurnService get communicateToManagers =>
      ref.watch(communicateToManagersRoundSelectTurnServiceProvider);
  IRouteRoundSelectTurnService get route =>
      ref.read(routeRoundSelectTurnServiceProvider);
  IManipulateStateRoundSelectTurnService get manipulateState =>
      ref.read(manipulateStateRoundSelectTurnServiceProvider);

  @override
  Future<void> selectPlayer(IPlayer player) async {
    await communicateToManagers.selectPlayer(player);
    route.navigateToRoundTurn();
  }

  @override
  Future<void> loadState() async {
    final players = await communicateToManagers.loadPlayers();
    manipulateState.initializeState(players);
  }
}
