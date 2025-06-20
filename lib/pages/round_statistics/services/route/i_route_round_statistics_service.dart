import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/round_statistics/services/route/route_round_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeRoundStatisticsServiceProvider =
    Provider.autoDispose<IRouteRoundStatisticsService>(
        (ref) => RouteRoundStatisticsService(ref));

abstract interface class IRouteRoundStatisticsService {
  void navigateToRound();
  void navigateToMatchStatistics(IMatch match);
}
