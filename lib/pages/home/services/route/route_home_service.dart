import 'package:billiards/pages/home/services/route/i_route_home_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:riverpod/riverpod.dart';

class RouteHomeService implements IRouteHomeService {
  final Ref ref;

  RouteHomeService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToGame() {
    navigateRoute.navigateTo(RouteType.matchSelectUsers);
  }

  @override
  void navigateToContinueGame(bool hasCurrentPlayer) {
    if (hasCurrentPlayer) {
      navigateRoute.navigateTo(RouteType.roundTurn);
    } else {
      navigateRoute.navigateTo(RouteType.roundSelectTurn);
    }
  }

  @override
  void navigateToUsers() {
    navigateRoute.navigateTo(RouteType.users);
  }

  @override
  void navigateToLeftMatches() {
    navigateRoute.navigateTo(RouteType.leftMatches);
  }

  @override
  void navigateToSettings() {
    navigateRoute.navigateTo(RouteType.settings);
  }
}
