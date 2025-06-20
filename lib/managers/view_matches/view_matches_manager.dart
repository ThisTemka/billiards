import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/services/view/i_view_match_service.dart';
import 'package:billiards/managers/view_matches/i_view_matches_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewMatchesManager implements IViewMatchesManager {
  final Ref _ref;

  ViewMatchesManager(this._ref);

  IViewMatchService get viewMatchService =>
      _ref.watch(viewMatchServiceProvider);

  @override
  Future<List<IMatch>> getSortedMatches() async {
    return await viewMatchService.getSortedMatches();
  }
}
