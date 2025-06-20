import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/entity/i_match_factory.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<List<int>> seedMatchRepository(Ref ref) async {
  final repository = ref.read(matchRepositoryProvider);
  final matches = await _create(ref);
  return await repository.addAll(matches);
}

Future<List<IMatch>> _create(Ref ref) async {
  final factory = ref.read(matchFactoryProvider);
  final rounds = await ref.read(roundRepositoryProvider).getAll();
  final users = await ref.read(userRepositoryProvider).getAll();

  return [
    factory(
      users: [
        users[0],
        users[1],
      ],
      start: DateTime.now(),
    ).copyWith(
      rounds: [
        rounds[0],
      ],
      end: DateTime.now().add(Duration(minutes: 10)),
    )
  ];
}
