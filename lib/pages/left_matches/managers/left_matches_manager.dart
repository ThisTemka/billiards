import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_matches/entities/state/services/manipulate/i_manipulate_state_left_matches_service.dart';
import 'package:billiards/pages/left_matches/managers/i_left_matches_manager.dart';
import 'package:billiards/pages/left_matches/services/communicate_to_managers/i_communicate_to_managers_left_matches_service.dart';
import 'package:billiards/pages/left_matches/services/route/i_route_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LeftMatchesManager implements ILeftMatchesManager {
  final Ref _ref;

  LeftMatchesManager(this._ref);

  IRouteLeftMatchesService get route =>
      _ref.read(routeLeftMatchesServiceProvider);
  IManipulateStateLeftMatchesService get manipulateState =>
      _ref.read(manipulateStateLeftMatchesServiceProvider);
  ICommunicateToManagersLeftMatchesService get communicateToManagers =>
      _ref.watch(communicateToManagersLeftMatchesServiceProvider);

  @override
  Future<void> loadState() async {
    final matches = await communicateToManagers.getMatches();
    manipulateState.initializeState(matches);
  }

  @override
  Future<void> deleteMatch(IMatch match) async {
    await communicateToManagers.deleteMatch(match);
    manipulateState.deleteMatch(match);
    Get.snackbar('', 'match_deleted'.tr);
  }

  @override
  Future<void> openMatch(IMatch match) async {
    route.navigateToMatch(match);
  }
}
