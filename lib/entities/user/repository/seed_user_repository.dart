import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/i_user_factory.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:riverpod/riverpod.dart';

Future<List<int>> seedUserRepository(Ref ref) async {
  final repository = ref.read(userRepositoryProvider);
  final users = _create(ref);
  return await repository.addAll(users);
}

List<IUser> _create(Ref ref) {
  final factory = ref.read(userFactoryProvider);

  return [
    factory(
      name: 'Player 1',
    ),
    factory(
      name: 'Player 2',
    ),
  ];
}
