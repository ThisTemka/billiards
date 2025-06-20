import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/entities/state/services/manipulate/i_manipulate_state_round_turn_service.dart';
import 'package:billiards/pages/round_turn/managers/i_round_turn_manager.dart';
import 'package:billiards/pages/round_turn/services/communicate_to_managers/i_communicate_to_managers_round_turn_service.dart';
import 'package:billiards/pages/round_turn/services/route/i_route_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundTurnManager implements IRoundTurnManager {
  final Ref ref;

  RoundTurnManager(this.ref);

  ICommunicateToManagersRoundTurnService get communicateToManagers =>
      ref.watch(communicateToManagersRoundTurnServiceProvider);
  IRouteRoundTurnService get route => ref.read(routeRoundTurnServiceProvider);
  IManipulateStateRoundTurnService get manipulateState =>
      ref.read(manipulateStateRoundTurnServiceProvider);

  @override
  Future<void> loadState() async {
    final player = await communicateToManagers.getCurrentPlayer();
    manipulateState.initializeState(player);
  }

  @override
  Future<void> completeTurn() async {
    final state = ref.read(roundTurnStateProvider);
    await communicateToManagers.completeTurn(state);
  }

  @override
  Future<void> closeRound() async {
    final round = await communicateToManagers.getCurrentRound();
    await communicateToManagers.closeRound();
    route.navigateToRoundStatistics(round);
  }

  @override
  void navigateToHome() {
    route.navigateToHome();
  }

  @override
  void incrementCurrentBall() {
    manipulateState.incrementCurrentBall();
  }

  @override
  void decrementCurrentBall() {
    manipulateState.decrementCurrentBall();
  }

  @override
  void incrementRandomBall() {
    manipulateState.incrementRandomBall();
  }

  @override
  void decrementRandomBall() {
    manipulateState.decrementRandomBall();
  }

  @override
  void incrementEnemyBall() {
    manipulateState.incrementEnemyBall();
  }

  @override
  void decrementEnemyBall() {
    manipulateState.decrementEnemyBall();
  }

  @override
  void toggleWhiteBall() {
    manipulateState.toggleWhiteBall();
  }

  @override
  void toggleBlackBall() {
    manipulateState.toggleBlackBall();
  }

  @override
  void toggleTableExit() {
    manipulateState.toggleTableExit();
  }

  @override
  void toggleTouchBall() {
    manipulateState.toggleTouchBall();
  }
}
