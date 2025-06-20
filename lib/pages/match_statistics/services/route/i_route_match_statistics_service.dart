import 'package:billiards/pages/match_statistics/services/route/route_match_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeMatchStatisticsServiceProvider =
    Provider.autoDispose<IRouteMatchStatisticsService>(
        (ref) => RouteMatchStatisticsService(ref));

abstract interface class IRouteMatchStatisticsService {
  void navigateToMatch();
  void navigateToMain();
}
