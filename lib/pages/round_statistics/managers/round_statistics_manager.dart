import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_statistics/entities/state/services/manipulate/i_manipulate_state_round_statistics_service.dart';
import 'package:billiards/pages/round_statistics/managers/i_round_statistics_manager.dart';
import 'package:billiards/pages/round_statistics/services/communicate_to_managers/i_communicate_to_managers_round_statistics_service.dart';
import 'package:billiards/pages/round_statistics/services/route/i_route_round_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundStatisticsManager implements IRoundStatisticsManager {
  final Ref _ref;

  RoundStatisticsManager(this._ref);

  IManipulateStateRoundStatisticsService get manipulateState =>
      _ref.read(manipulateStateRoundStatisticsServiceProvider);
  ICommunicateToManagersRoundStatisticsService get communicateToManagers =>
      _ref.watch(communicateToManagersRoundStatisticsServiceProvider);
  IRouteRoundStatisticsService get route =>
      _ref.read(routeRoundStatisticsServiceProvider);

  @override
  void loadState(IRound round) {
    manipulateState.initializeState(round);
  }

  @override
  void nextRound() {
    communicateToManagers.nextRound();
    route.navigateToRound();
  }

  @override
  Future<void> closeMatch() async {
    final match = await communicateToManagers.getCurrentMatch();
    communicateToManagers.closeMatch();
    route.navigateToMatchStatistics(match);
  }
}
