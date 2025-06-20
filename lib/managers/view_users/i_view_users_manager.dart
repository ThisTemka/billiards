import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/view_users/view_users_manager.dart';
import 'package:riverpod/riverpod.dart';

final viewUsersManagerProvider = Provider.autoDispose<IViewUsersManager>((ref) {
  return ViewUsersManager(ref);
});

abstract interface class IViewUsersManager {
  Future<List<IUser>> getFilteredAll();
  Future<int> getTop(IUser user);
  Future<List<IUser>> getAll();
}
