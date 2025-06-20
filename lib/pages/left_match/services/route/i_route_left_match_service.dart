import 'package:billiards/pages/left_match/services/route/route_left_match_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/round/entity/i_round.dart';

final routeLeftMatchServiceProvider =
    Provider.autoDispose<IRouteLeftMatchService>(
        (ref) => RouteLeftMatchService(ref));

abstract interface class IRouteLeftMatchService {
  void navigateToRound(IRound round);
  void navigateToBack();
}
