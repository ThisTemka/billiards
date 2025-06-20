import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/managers/manipulate_matches/manipulate_matches_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateMatchesManagerProvider =
    Provider.autoDispose<IManipulateMatchesManager>((ref) {
  return ManipulateMatchesManager(ref);
});

abstract interface class IManipulateMatchesManager {
  Future<void> deleteMatch(IMatch match);
}
