import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_round/entities/state/services/manipulate/i_manipulate_state_left_round_service.dart';
import 'package:billiards/pages/left_round/managers/i_left_round_manager.dart';
import 'package:billiards/pages/left_round/services/route/i_route_left_round_service.dart';
import 'package:riverpod/riverpod.dart';

class LeftRoundManager implements ILeftRoundManager {
  final Ref ref;

  LeftRoundManager(this.ref);

  IManipulateStateLeftRoundService get manipulateState =>
      ref.watch(manipulateStateLeftRoundServiceProvider);
  IRouteLeftRoundService get route => ref.watch(routeLeftRoundServiceProvider);

  @override
  void loadState(IRound round, int roundIndex) {
    manipulateState.initializeState(round, roundIndex);
  }

  @override
  void navigateToBack() {
    route.navigateToBack();
  }
}
