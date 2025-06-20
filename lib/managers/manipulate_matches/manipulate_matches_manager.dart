import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/services/manipulate_repository/i_manipulate_matches_service.dart';
import 'package:billiards/managers/manipulate_matches/i_manipulate_matches_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateMatchesManager implements IManipulateMatchesManager {
  final Ref _ref;

  ManipulateMatchesManager(this._ref);

  IManipulateMatchesService get manipulateMatches =>
      _ref.read(manipulateMatchesServiceProvider);

  @override
  Future<void> deleteMatch(IMatch match) async {
    await manipulateMatches.deleteMatch(match);
  }
}
