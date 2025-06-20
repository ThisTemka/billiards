import 'package:billiards/pages/left_matches/entities/state/services/manipulate/manipulate_state_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/match/entity/i_match.dart';

final manipulateStateLeftMatchesServiceProvider =
    Provider.autoDispose<IManipulateStateLeftMatchesService>((ref) {
  return ManipulateStateLeftMatchesService(ref);
});

abstract interface class IManipulateStateLeftMatchesService {
  void initializeState(List<IMatch> matches);
  void deleteMatch(IMatch match);
}
