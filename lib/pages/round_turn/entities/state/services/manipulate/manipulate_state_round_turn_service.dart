import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_turn/entities/state/services/manipulate/i_manipulate_state_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';

class ManipulateStateRoundTurnService
    implements IManipulateStateRoundTurnService {
  final Ref ref;

  ManipulateStateRoundTurnService(this.ref);

  void setState(RoundTurnState state) =>
      ref.read(roundTurnStateProvider.notifier).state = state;
  RoundTurnState get state => ref.read(roundTurnStateProvider);

  @override
  void initializeState(IPlayer player) {
    setState(state.copyWith(
      isLoading: false,
      player: player,
    ));
  }

  @override
  void incrementCurrentBall() {
    setState(state.copyWith(
      currentBalls: state.currentBalls + 1,
    ));
  }

  @override
  void decrementCurrentBall() {
    if (state.currentBalls > 0) {
      setState(state.copyWith(
        currentBalls: state.currentBalls - 1,
      ));
    }
  }

  @override
  void incrementRandomBall() {
    setState(state.copyWith(
      randomBalls: state.randomBalls + 1,
    ));
  }

  @override
  void decrementRandomBall() {
    if (state.randomBalls > 0) {
      setState(state.copyWith(
        randomBalls: state.randomBalls - 1,
      ));
    }
  }

  @override
  void incrementEnemyBall() {
    setState(state.copyWith(
      enemyBalls: state.enemyBalls + 1,
    ));
  }

  @override
  void decrementEnemyBall() {
    if (state.enemyBalls > 0) {
      setState(state.copyWith(
        enemyBalls: state.enemyBalls - 1,
      ));
    }
  }

  @override
  void toggleWhiteBall() {
    setState(state.copyWith(
      whiteBall: !state.whiteBall,
    ));
  }

  @override
  void toggleBlackBall() {
    setState(state.copyWith(
      blackBall: !state.blackBall,
    ));
  }

  @override
  void toggleTableExit() {
    setState(state.copyWith(
      tableExit: !state.tableExit,
    ));
  }

  @override
  void toggleTouchBall() {
    setState(state.copyWith(
      touchBall: !state.touchBall,
    ));
  }
}
