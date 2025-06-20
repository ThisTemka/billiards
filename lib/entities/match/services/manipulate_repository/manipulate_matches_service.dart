import 'package:billiards/entities/match/entity/i_match_factory.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/services/manipulate_repository/i_manipulate_matches_service.dart';

class ManipulateMatchesService implements IManipulateMatchesService {
  final Ref _ref;
  final IMatchRepository repository;

  ManipulateMatchesService(this._ref, this.repository);

  IMatchFactory get factory => _ref.read(matchFactoryProvider);

  @override
  Future<void> deleteMatch(IMatch match) async {
    await repository.delete(match.id);
  }

  @override
  Future<IMatch> createMatch(List<IUser> users) async {
    final newMatch = factory(users: users, start: DateTime.now());
    await repository.add(newMatch);
    return newMatch;
  }
}
