import 'package:billiards/pages/home/entities/state/services/manipulate/i_manipulate_home_state_service.dart';
import 'package:billiards/pages/home/managers/i_home_manager.dart';
import 'package:billiards/pages/home/services/communicate_to_managers/i_communicate_to_managers_home_service.dart';
import 'package:billiards/pages/home/services/route/i_route_home_service.dart';
import 'package:riverpod/riverpod.dart';

class HomeManager implements IHomeManager {
  final Ref ref;

  HomeManager(this.ref);

  ICommunicateToManagersHomeService get communicateToManagers =>
      ref.watch(communicateToManagersHomeServiceProvider);
  IManipulateStateHomeService get manipulateState =>
      ref.read(manipulateStateHomeServiceProvider);
  IRouteHomeService get route => ref.read(routeHomeServiceProvider);

  @override
  Future<void> startNewGame() async {
    if (await communicateToManagers.hasUnfinishedMatch()) {
      await communicateToManagers.closeMatch();
    }
    route.navigateToGame();
  }

  @override
  Future<void> loadState() async {
    final hasUnfinishedMatch = await communicateToManagers.hasUnfinishedMatch();
    manipulateState.initializeState(hasUnfinishedMatch);
  }

  @override
  Future<void> continueMatch() async {
    final hasCurrentPlayer = await communicateToManagers.hasCurrentPlayer();
    route.navigateToContinueGame(hasCurrentPlayer);
  }

  @override
  void navigateToUsers() {
    route.navigateToUsers();
  }

  @override
  void navigateToLeftMatches() {
    route.navigateToLeftMatches();
  }

  @override
  void navigateToSettings() {
    route.navigateToSettings();
  }
}
