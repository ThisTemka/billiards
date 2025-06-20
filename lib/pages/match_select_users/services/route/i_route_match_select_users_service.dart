import 'package:billiards/pages/match_select_users/services/route/route_match_select_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeMatchSelectUsersServiceProvider =
    Provider.autoDispose<IRouteMatchSelectUsersService>(
        (ref) => RouteMatchSelectUsersService(ref));

abstract interface class IRouteMatchSelectUsersService {
  void navigateToRoundSelectTurn();
}
