import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_turn/services/route/route_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeRoundTurnServiceProvider =
    Provider.autoDispose<IRouteRoundTurnService>(
        (ref) => RouteRoundTurnService(ref));

abstract interface class IRouteRoundTurnService {
  void navigateToRoundStatistics(IRound round);
  void navigateToHome();
}
