import 'package:billiards/services/router/entity/i_route_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:get/get.dart';

class NavigateRouteService implements INavigateRouteService {
  final IRouteService routeService;

  NavigateRouteService(this.routeService);

  @override
  void navigateTo(RouteType route) {
    final routeName = route.toRouteName();
    Get.toNamed(routeName);
  }

  @override
  void navigateToWithArguments(RouteType route, arguments) {
    final routeName = route.toRouteName();
    Get.toNamed(routeName, arguments: arguments);
  }

  @override
  void navigateToBack() {
    Get.back();
  }

  @override
  void navigateUntil(RouteType route) {
    final routeName = route.toRouteName();
    Get.until((route) => route.settings.name == routeName);
  }
}
