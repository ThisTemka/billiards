import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/round_statistics/services/route/i_route_round_statistics_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteRoundStatisticsService implements IRouteRoundStatisticsService {
  final Ref ref;
  RouteRoundStatisticsService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToRound() {
    navigateRoute.navigateTo(RouteType.roundSelectTurn);
  }

  @override
  void navigateToMatchStatistics(IMatch match) {
    navigateRoute.navigateToWithArguments(RouteType.matchStatistics, [match]);
  }
}
