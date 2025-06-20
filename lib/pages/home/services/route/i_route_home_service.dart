import 'package:billiards/pages/home/services/route/route_home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeHomeServiceProvider =
    Provider.autoDispose<IRouteHomeService>((ref) => RouteHomeService(ref));

abstract interface class IRouteHomeService {
  void navigateToGame();
  void navigateToContinueGame(bool hasCurrentPlayer);
  void navigateToUsers();
  void navigateToLeftMatches();
  void navigateToSettings();
}
