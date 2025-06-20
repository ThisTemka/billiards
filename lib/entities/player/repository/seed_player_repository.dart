import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/i_player_factory.dart';
import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<List<int>> seedPlayerRepository(Ref ref) async {
  final repository = ref.read(playerRepositoryProvider);
  final players = await _create(ref);
  return await repository.addAll(players);
}

Future<List<IPlayer>> _create(Ref ref) async {
  final factory = ref.read(playerFactoryProvider);
  final users = await ref.read(userRepositoryProvider).getAll();

  return [
    factory(
      user: users[0],
    ),
    factory(
      user: users[1],
    ),
  ];
}
