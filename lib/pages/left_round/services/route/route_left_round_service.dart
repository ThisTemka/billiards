import 'package:billiards/pages/left_round/services/route/i_route_left_round_service.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';

class RouteLeftRoundService implements IRouteLeftRoundService {
  final INavigateRouteService navigateRouteService;

  RouteLeftRoundService(this.navigateRouteService);

  @override
  void navigateToBack() {
    navigateRouteService.navigateToBack();
  }
}
