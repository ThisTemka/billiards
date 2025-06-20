import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/user.dart';
import 'package:riverpod/riverpod.dart';

final userFactoryProvider = Provider.autoDispose<IUserFactory>((ref) {
  return User.create;
});

typedef IUserFactory = IUser Function({
  required String name,
});
