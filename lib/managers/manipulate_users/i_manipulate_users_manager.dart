import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/manipulate_users/manipulate_users_manager.dart';
import 'package:riverpod/riverpod.dart';

final manipulateUsersManagerProvider = Provider<IManipulateUsersManager>(
  (ref) {
    return ManipulateUsersManager(ref);
  },
);

abstract interface class IManipulateUsersManager {
  Future<void> deleteUser(IUser user);
  Future<IUser> createUser(String name);
}
