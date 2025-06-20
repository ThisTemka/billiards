import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/user/entities/state/services/manipulate/i_manipulate_state_user_service.dart';
import 'package:billiards/pages/user/managers/i_user_manager.dart';
import 'package:billiards/pages/user/services/communicate_to_managers/i_communicate_to_managers_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserManager implements IUserManager {
  final Ref ref;

  UserManager(this.ref);

  IManipulateStateUserService get manipulateState =>
      ref.read(manipulateStateUserServiceProvider);
  ICommunicateToManagersUserService get communicateFeatures =>
      ref.watch(communicateToManagersUserServiceProvider);

  Future<void> loadState(IUser user) async {
    final top = await communicateFeatures.getTop(user);
    manipulateState.initializeState(user, top);
  }
}
