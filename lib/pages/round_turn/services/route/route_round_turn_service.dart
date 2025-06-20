import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_turn/services/route/i_route_round_turn_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteRoundTurnService implements IRouteRoundTurnService {
  final Ref ref;

  RouteRoundTurnService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToRoundStatistics(IRound round) {
    navigateRoute.navigateToWithArguments(RouteType.roundStatistics, [round]);
  }

  @override
  void navigateToHome() {
    navigateRoute.navigateTo(RouteType.home);
  }
}
