import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/services/game/game_match_service.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameMatchServiceProvider = Provider.autoDispose<IGameMatchService>((ref) {
  final repository = ref.read(matchRepositoryProvider);
  return GameMatchService(ref, repository);
});

abstract interface class IGameMatchService {
  Future<IMatch> startMatch(List<IUser> users);
  Future<void> endMatch(IMatch match);
  Future<void> addRound(IMatch match, IRound newRound);
}
