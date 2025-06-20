import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_round/entities/state/services/manipulate/i_manipulate_state_left_round_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:billiards/pages/left_round/entities/state/left_round_state.dart';

class ManipulateStateLeftRoundService
    implements IManipulateStateLeftRoundService {
  final Ref ref;

  ManipulateStateLeftRoundService(this.ref);

  void setState(LeftRoundState state) =>
      ref.read(leftRoundStateProvider.notifier).state = state;
  LeftRoundState get state => ref.read(leftRoundStateProvider);

  @override
  void initializeState(IRound round, int roundIndex) {
    setState(state.copyWith(
      round: round,
      roundIndex: roundIndex,
      isLoading: false,
    ));
  }
}
