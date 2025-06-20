import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_statistics/entities/state/services/manipulate/i_manipulate_state_round_statistics_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:billiards/pages/round_statistics/entities/state/round_statistics_state.dart';

class ManipulateStateRoundStatisticsService
    implements IManipulateStateRoundStatisticsService {
  final Ref ref;

  ManipulateStateRoundStatisticsService(this.ref);

  void setState(RoundStatisticsState state) =>
      ref.read(roundStatisticsStateProvider.notifier).state = state;

  RoundStatisticsState get roundStatisticsState =>
      ref.read(roundStatisticsStateProvider);

  @override
  void initializeState(IRound round) {
    setState(RoundStatisticsState(round: round, isLoading: false));
  }
}
