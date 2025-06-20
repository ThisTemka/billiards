import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/users/entities/state/services/manipulate/i_manipulate_state_users_service.dart';
import 'package:billiards/pages/users/managers/i_users_manager.dart';
import 'package:billiards/pages/users/services/communicate_to_managers/i_communicate_to_managers_users_service.dart';
import 'package:billiards/pages/users/services/route/i_route_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class UsersManager implements IUsersManager {
  final Ref _ref;

  UsersManager(this._ref);

  ICommunicateToManagersUsersService get communicateFeatures =>
      _ref.watch(communicateToManagersUsersServiceProvider);
  IManipulateStateUsersService get manipulateState =>
      _ref.read(manipulateStateUsersServiceProvider);
  IRouteUsersService get route => _ref.read(routeUsersServiceProvider);

  @override
  Future<void> loadState() async {
    final users = await communicateFeatures.getUsers();
    manipulateState.initializeState(users);
  }

  @override
  Future<void> deleteUser(IUser user) async {
    await communicateFeatures.deleteUser(user);
    manipulateState.deleteUser(user);
    Get.snackbar('', 'user_deleted'.tr);
  }

  @override
  Future<void> navigateToUser(IUser user) async {
    route.navigateToUser(user);
  }
}
