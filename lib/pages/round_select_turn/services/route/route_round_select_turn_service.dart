import 'package:billiards/pages/round_select_turn/services/route/i_route_round_select_turn_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteRoundSelectTurnService implements IRouteRoundSelectTurnService {
  final Ref ref;

  RouteRoundSelectTurnService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToRoundTurn() {
    navigateRoute.navigateTo(RouteType.roundTurn);
  }
}
