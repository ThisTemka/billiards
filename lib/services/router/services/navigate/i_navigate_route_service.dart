import 'package:billiards/services/router/entity/i_route_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigateRouteServiceProvider =
    Provider.autoDispose<INavigateRouteService>((ref) {
  final routeService = ref.watch(routeServiceProvider);
  return NavigateRouteService(routeService);
});

abstract interface class INavigateRouteService {
  void navigateTo(RouteType route);
  void navigateToWithArguments(RouteType route, arguments);
  void navigateToBack();
  void navigateUntil(RouteType route);
}
