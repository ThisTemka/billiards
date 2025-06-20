import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/users/services/communicate_to_managers/communicate_to_managers_users_service.dart';

final communicateToManagersUsersServiceProvider =
    Provider.autoDispose<ICommunicateToManagersUsersService>(
        (ref) => CommunicateToManagersUsersService(ref));

abstract interface class ICommunicateToManagersUsersService {
  Future<List<IUser>> getUsers();
  Future<void> deleteUser(IUser user);
}
