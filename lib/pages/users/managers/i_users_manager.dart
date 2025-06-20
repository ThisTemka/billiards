import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/users/managers/users_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersManagerProvider =
    Provider.autoDispose<IUsersManager>((ref) => UsersManager(ref));

abstract interface class IUsersManager {
  void loadState();
  void deleteUser(IUser user);
  void navigateToUser(IUser user);
}
