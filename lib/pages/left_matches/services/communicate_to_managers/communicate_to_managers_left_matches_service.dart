import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/managers/manipulate_matches/i_manipulate_matches_manager.dart';
import 'package:billiards/managers/view_matches/i_view_matches_manager.dart';
import 'package:billiards/pages/left_matches/services/communicate_to_managers/i_communicate_to_managers_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersLeftMatchesService
    implements ICommunicateToManagersLeftMatchesService {
  final Ref _ref;

  CommunicateToManagersLeftMatchesService(this._ref);

  IViewMatchesManager get viewMatchesManager =>
      _ref.watch(viewMatchesManagerProvider);
  IManipulateMatchesManager get manipulateMatchesManager =>
      _ref.read(manipulateMatchesManagerProvider);

  @override
  Future<List<IMatch>> getMatches() async {
    return await viewMatchesManager.getSortedMatches();
  }

  @override
  Future<void> deleteMatch(IMatch match) async {
    await manipulateMatchesManager.deleteMatch(match);
  }
}
