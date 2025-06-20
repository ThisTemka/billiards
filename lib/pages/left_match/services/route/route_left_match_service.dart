import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_match/services/route/i_route_left_match_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteLeftMatchService implements IRouteLeftMatchService {
  final Ref ref;

  RouteLeftMatchService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToRound(IRound round) {
    navigateRoute.navigateTo(RouteType.leftRound);
  }

  @override
  void navigateToBack() {
    navigateRoute.navigateToBack();
  }
}
