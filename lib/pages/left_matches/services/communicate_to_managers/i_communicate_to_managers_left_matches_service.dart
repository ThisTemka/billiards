import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_matches/services/communicate_to_managers/communicate_to_managers_left_matches_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersLeftMatchesServiceProvider =
    Provider.autoDispose<ICommunicateToManagersLeftMatchesService>(
        (ref) => CommunicateToManagersLeftMatchesService(ref));

abstract interface class ICommunicateToManagersLeftMatchesService {
  Future<List<IMatch>> getMatches();
  Future<void> deleteMatch(IMatch match);
}
