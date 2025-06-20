import 'package:billiards/pages/left_match/left_match_page.dart';
import 'package:billiards/pages/round_select_turn/round_select_turn_page.dart';
import 'package:billiards/pages/match_select_users/match_select_users_page.dart';
import 'package:billiards/pages/round_turn/round_turn_page.dart';
import 'package:billiards/pages/left_round/left_round_page.dart';
import 'package:billiards/pages/user/user_page.dart';
import 'package:billiards/services/router/entity/i_routes.dart';
import 'package:billiards/pages/home/home_page.dart';
import 'package:billiards/pages/round_statistics/round_statistics_page.dart';
import 'package:billiards/pages/left_matches/left_matches_page.dart';
import 'package:billiards/pages/match_statistics/match_statistics_page.dart';
import 'package:billiards/pages/settings/settings_page.dart';
import 'package:billiards/pages/users/users_page.dart';
import 'package:billiards/pages/unknown/unknown_page.dart';
import 'package:billiards/services/router/entity/i_route_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final implRouterServiceProvider = StateProvider<RouteService>((ref) {
  return RouteService();
});

class RouteService implements IRoutes, IRouteService {
  @override
  List<GetPage> get pages => [
        GetPage(
            name: RouteType.home.toRouteName(), page: () => const HomePage()),
        GetPage(
            name: RouteType.roundTurn.toRouteName(),
            page: () => const RoundTurnPage()),
        GetPage(
            name: RouteType.matchSelectUsers.toRouteName(),
            page: () => const MatchSelectUsersPage()),
        GetPage(
            name: RouteType.roundSelectTurn.toRouteName(),
            page: () => const RoundSelectTurnPage()),
        GetPage(
            name: RouteType.roundStatistics.toRouteName(),
            page: () => RoundStatisticsPage(round: Get.arguments[0])),
        GetPage(
            name: RouteType.leftMatches.toRouteName(),
            page: () => const LeftMatchesPage()),
        GetPage(
            name: RouteType.matchStatistics.toRouteName(),
            page: () => MatchStatisticsPage(match: Get.arguments[0])),
        GetPage(
            name: RouteType.settings.toRouteName(),
            page: () => const SettingsPage()),
        GetPage(
            name: RouteType.users.toRouteName(), page: () => const UsersPage()),
        GetPage(
            name: RouteType.user.toRouteName(),
            page: () => UserPage(user: Get.arguments[0])),
        GetPage(
            name: RouteType.unknown.toRouteName(),
            page: () => const UnknownPage()),
        GetPage(
            name: RouteType.leftMatch.toRouteName(),
            page: () => LeftMatchPage(match: Get.arguments[0])),
        GetPage(
            name: RouteType.leftRound.toRouteName(),
            page: () => LeftRoundPage(
                roundIndex: Get.arguments[0], round: Get.arguments[1])),
      ];

  @override
  String get initialPage => '/';

  @override
  GetPage get unknownPage =>
      GetPage(name: '/unknown', page: () => const UnknownPage());
}
