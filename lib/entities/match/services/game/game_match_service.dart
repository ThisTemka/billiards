import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/entity/i_match_factory.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/services/game/i_game_match_service.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

class GameMatchService implements IGameMatchService {
  final Ref ref;
  final IMatchRepository repository;

  GameMatchService(this.ref, this.repository);

  IMatchFactory get factory => ref.read(matchFactoryProvider);
  Future<void> update(IMatch match) => repository.update(match);

  @override
  Future<IMatch> startMatch(List<IUser> users) async {
    final newMatch = factory(users: users, start: DateTime.now());
    await repository.add(newMatch);
    return newMatch;
  }

  @override
  Future<void> endMatch(IMatch match) async {
    await update(match.copyWith(
      end: DateTime.now(),
    ));
  }

  @override
  Future<void> addRound(IMatch match, IRound newRound) async {
    await update(match.copyWith(
      rounds: [...match.rounds, newRound],
    ));
  }
}
