import 'package:billiards/pages/left_matches/services/route/route_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/match/entity/i_match.dart';

final routeLeftMatchesServiceProvider =
    Provider.autoDispose<IRouteLeftMatchesService>(
        (ref) => RouteLeftMatchesService(ref));

abstract interface class IRouteLeftMatchesService {
  void navigateToMatch(IMatch match);
}
