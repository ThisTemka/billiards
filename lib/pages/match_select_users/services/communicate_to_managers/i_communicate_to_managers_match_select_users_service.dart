import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/match_select_users/services/communicate_to_managers/communicate_to_managers_match_select_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersMatchSelectUsersServiceProvider =
    Provider.autoDispose<ICommunicateToManagersMatchSelectUsersService>(
        (ref) => CommunicateToManagersMatchSelectUsersService(ref));

abstract interface class ICommunicateToManagersMatchSelectUsersService {
  Future<void> startNewMatch(List<IUser> users);
  Future<IUser> createUser(String name);
  Future<List<IUser>> getUsers();
}
