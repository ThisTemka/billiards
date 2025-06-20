import 'package:billiards/pages/left_matches/services/route/i_route_left_matches_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/match/entity/i_match.dart';

class RouteLeftMatchesService implements IRouteLeftMatchesService {
  final Ref ref;

  RouteLeftMatchesService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToMatch(IMatch match) {
    navigateRoute.navigateTo(RouteType.leftMatch);
  }
}
