import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_matches/managers/left_matches_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leftMatchesManagerProvider =
    Provider.autoDispose<ILeftMatchesManager>((ref) => LeftMatchesManager(ref));

abstract interface class ILeftMatchesManager {
  Future<void> loadState();
  Future<void> openMatch(IMatch match);
  Future<void> deleteMatch(IMatch match);
}
