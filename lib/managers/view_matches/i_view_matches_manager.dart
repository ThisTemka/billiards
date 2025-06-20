import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/managers/view_matches/view_matches_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewMatchesManagerProvider =
    Provider.autoDispose((ref) => ViewMatchesManager(ref));

abstract interface class IViewMatchesManager {
  Future<List<IMatch>> getSortedMatches();
}
