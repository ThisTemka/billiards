import 'package:billiards/pages/left_round/services/route/route_left_round_service.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeLeftRoundServiceProvider =
    Provider.autoDispose<IRouteLeftRoundService>((ref) {
  final navigateRouteService = ref.watch(navigateRouteServiceProvider);
  return RouteLeftRoundService(navigateRouteService);
});

abstract interface class IRouteLeftRoundService {
  void navigateToBack();
}
