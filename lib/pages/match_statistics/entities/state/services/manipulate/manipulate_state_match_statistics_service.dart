import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/match_statistics/entities/state/services/manipulate/i_manipulate_state_match_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/match_statistics/entities/state/match_statistics_state.dart';

class ManipulateStateMatchStatisticsService
    implements IManipulateStateMatchStatisticsService {
  final Ref ref;

  ManipulateStateMatchStatisticsService(this.ref);

  void setState(MatchStatisticsState state) =>
      ref.read(matchStatisticsStateProvider.notifier).state = state;
  MatchStatisticsState get state => ref.read(matchStatisticsStateProvider);

  @override
  void initializeState(IMatch match) {
    setState(MatchStatisticsState(match: match, isLoading: false));
  }
}
