import 'package:billiards/pages/users/services/communicate_to_managers/i_communicate_to_managers_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/manipulate_users/i_manipulate_users_manager.dart';
import 'package:billiards/managers/view_users/i_view_users_manager.dart';

class CommunicateToManagersUsersService
    implements ICommunicateToManagersUsersService {
  final Ref _ref;

  CommunicateToManagersUsersService(this._ref);

  IViewUsersManager get viewUsers => _ref.watch(viewUsersManagerProvider);
  IManipulateUsersManager get manipulateUsers =>
      _ref.read(manipulateUsersManagerProvider);

  @override
  Future<List<IUser>> getUsers() async {
    return await viewUsers.getFilteredAll();
  }

  @override
  Future<void> deleteUser(IUser user) async {
    await manipulateUsers.deleteUser(user);
  }
}
