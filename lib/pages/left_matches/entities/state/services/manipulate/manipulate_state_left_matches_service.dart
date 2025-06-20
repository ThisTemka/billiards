import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_matches/entities/state/services/manipulate/i_manipulate_state_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/left_matches/entities/state/left_matches_state.dart';

class ManipulateStateLeftMatchesService
    implements IManipulateStateLeftMatchesService {
  final Ref _ref;

  ManipulateStateLeftMatchesService(this._ref);

  void setState(LeftMatchesState state) =>
      _ref.read(leftMatchesStateProvider.notifier).state = state;
  LeftMatchesState get state => _ref.read(leftMatchesStateProvider);

  @override
  void initializeState(List<IMatch> matches) {
    setState(state.copyWith(matches: matches, isLoading: false));
  }

  @override
  void deleteMatch(IMatch match) {
    setState(state.copyWith(
        matches: state.matches.where((m) => m.id != match.id).toList()));
  }
}
