import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/game/i_user_turn.dart';
import 'package:billiards/entities/user/services/game/game_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameUserServiceProvider = Provider.autoDispose<IGameUserService>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return GameUserService(ref, repository);
});

abstract interface class IGameUserService {
  Future<void> turn(IUser user, IUserTurn turn);
  Future<void> turnForEnemy(IUser user, IUserTurn turn);
}
