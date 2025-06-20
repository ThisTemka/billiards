import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/match_statistics/entities/state/services/manipulate/i_manipulate_state_match_statistics_service.dart';
import 'package:billiards/pages/match_statistics/managers/i_match_statistics_manager.dart';
import 'package:billiards/pages/match_statistics/services/route/i_route_match_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchStatisticsManager implements IMatchStatisticsManager {
  final Ref _ref;

  MatchStatisticsManager(this._ref);

  IManipulateStateMatchStatisticsService get manipulateState =>
      _ref.read(manipulateStateMatchStatisticsServiceProvider);
  IRouteMatchStatisticsService get route =>
      _ref.read(routeMatchStatisticsServiceProvider);

  @override
  void loadState(IMatch match) {
    manipulateState.initializeState(match);
  }

  @override
  void startNewMatch() {
    route.navigateToMatch();
  }

  @override
  void exit() {
    route.navigateToMain();
  }
}
