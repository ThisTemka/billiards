import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_match/entities/state/services/manipulate/i_manipulate_state_left_match_service.dart';
import 'package:billiards/pages/left_match/managers/i_left_match_manager.dart';
import 'package:billiards/pages/left_match/services/route/i_route_left_match_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftMatchManager implements ILeftMatchManager {
  final Ref ref;

  LeftMatchManager(this.ref);

  IManipulateStateLeftMatchService get manipulateState =>
      ref.read(manipulateStateLeftMatchServiceProvider);
  IRouteLeftMatchService get route => ref.read(routeLeftMatchServiceProvider);

  @override
  void loadState(IMatch match) {
    manipulateState.initializeState(match);
  }

  @override
  void navigateToRound(IRound round) {
    route.navigateToRound(round);
  }
}
