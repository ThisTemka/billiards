import 'package:billiards/pages/match_select_users/services/route/i_route_match_select_users_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteMatchSelectUsersService implements IRouteMatchSelectUsersService {
  final Ref ref;

  RouteMatchSelectUsersService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToRoundSelectTurn() {
    navigateRoute.navigateTo(RouteType.roundSelectTurn);
  }
}
