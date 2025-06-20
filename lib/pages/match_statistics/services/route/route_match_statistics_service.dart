import 'package:billiards/pages/match_statistics/services/route/i_route_match_statistics_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteMatchStatisticsService implements IRouteMatchStatisticsService {
  final Ref ref;

  RouteMatchStatisticsService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToMatch() {
    navigateRoute.navigateTo(RouteType.matchSelectUsers);
  }

  @override
  void navigateToMain() {
    navigateRoute.navigateTo(RouteType.home);
  }
}
