import 'package:billiards/pages/user/services/communicate_to_managers/i_communicate_to_managers_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/view_users/i_view_users_manager.dart';

class CommunicateToManagersUserService
    implements ICommunicateToManagersUserService {
  final Ref _ref;

  CommunicateToManagersUserService(this._ref);

  IViewUsersManager get viewUsersManager =>
      _ref.watch(viewUsersManagerProvider);

  @override
  Future<int> getTop(IUser user) async {
    return await viewUsersManager.getTop(user);
  }
}
