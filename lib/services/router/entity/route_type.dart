enum RouteType {
  home,
  roundTurn,
  matchSelectUsers,
  roundSelectTurn,
  roundStatistics,
  leftMatches,
  matchStatistics,
  settings,
  users,
  user,
  unknown,
  leftMatch,
  leftRound;

  String toRouteName() => switch (this) {
        RouteType.home => '/',
        RouteType.roundTurn => '/match_turn',
        RouteType.matchSelectUsers => '/match_select_users',
        RouteType.roundSelectTurn => '/match_select_turn',
        RouteType.roundStatistics => '/roundStatistics',
        RouteType.leftMatches => '/history',
        RouteType.matchStatistics => '/gameStatistics',
        RouteType.settings => '/settings',
        RouteType.users => '/users',
        RouteType.user => '/user',
        RouteType.unknown => '/unknown',
        RouteType.leftMatch => '/match_history',
        RouteType.leftRound => '/round_history',
      };

  RouteType fromRouteName(String routeName) => switch (routeName) {
        '/' => RouteType.home,
        '/match_turn' => RouteType.roundTurn,
        '/match_select_users' => RouteType.matchSelectUsers,
        '/match_select_turn' => RouteType.roundSelectTurn,
        '/roundStatistics' => RouteType.roundStatistics,
        '/history' => RouteType.leftMatches,
        '/gameStatistics' => RouteType.matchStatistics,
        '/settings' => RouteType.settings,
        '/users' => RouteType.users,
        '/user' => RouteType.user,
        '/unknown' => RouteType.unknown,
        '/match_history' => RouteType.leftMatch,
        '/round_history' => RouteType.leftRound,
        _ => RouteType.unknown,
      };
}
