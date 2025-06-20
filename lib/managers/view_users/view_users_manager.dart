import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/services/view/i_view_user_service.dart';
import 'package:billiards/managers/view_users/i_view_users_manager.dart';
import 'package:riverpod/riverpod.dart';

class ViewUsersManager implements IViewUsersManager {
  final Ref ref;

  ViewUsersManager(this.ref);

  IViewUserService get viewUserService => ref.watch(viewUserServiceProvider);

  @override
  Future<List<IUser>> getFilteredAll() async {
    return await viewUserService.getFilteredAll();
  }

  @override
  Future<int> getTop(IUser user) async {
    return (await viewUserService.getFilteredAll()).indexOf(user);
  }

  @override
  Future<List<IUser>> getAll() async {
    return await viewUserService.getAll();
  }
}
