import 'package:billiards/pages/round_select_turn/services/route/route_round_select_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeRoundSelectTurnServiceProvider =
    Provider.autoDispose<IRouteRoundSelectTurnService>(
        (ref) => RouteRoundSelectTurnService(ref));

abstract interface class IRouteRoundSelectTurnService {
  void navigateToRoundTurn();
}
