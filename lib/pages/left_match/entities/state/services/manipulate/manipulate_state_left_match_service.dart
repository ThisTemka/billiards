import 'package:billiards/pages/left_match/entities/state/services/manipulate/i_manipulate_state_left_match_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_match/entities/state/left_match_state.dart';

class ManipulateStateLeftMatchService
    implements IManipulateStateLeftMatchService {
  final Ref ref;

  ManipulateStateLeftMatchService(this.ref);

  void setState(LeftMatchState state) =>
      ref.read(leftMatchStateProvider.notifier).state = state;
  LeftMatchState get state => ref.read(leftMatchStateProvider);

  @override
  void initializeState(IMatch match) {
    setState(state.copyWith(match: match, isLoading: false));
  }
}
