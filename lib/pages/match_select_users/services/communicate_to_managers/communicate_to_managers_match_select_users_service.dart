import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/manipulate_users/i_manipulate_users_manager.dart';
import 'package:billiards/managers/view_users/i_view_users_manager.dart';
import 'package:billiards/pages/match_select_users/services/communicate_to_managers/i_communicate_to_managers_match_select_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersMatchSelectUsersService
    implements ICommunicateToManagersMatchSelectUsersService {
  final Ref _ref;

  CommunicateToManagersMatchSelectUsersService(this._ref);

  IManipulateGameManager get manipulateGameManager =>
      _ref.read(manipulateGameManagerProvider);
  IManipulateUsersManager get manipulateUsersManager =>
      _ref.read(manipulateUsersManagerProvider);
  IViewUsersManager get viewUsersManager =>
      _ref.watch(viewUsersManagerProvider);

  @override
  Future<void> startNewMatch(List<IUser> users) async {
    await manipulateGameManager.openMatch(users);
  }

  @override
  Future<IUser> createUser(String name) async {
    return await manipulateUsersManager.createUser(name);
  }

  @override
  Future<List<IUser>> getUsers() async {
    return await viewUsersManager.getAll();
  }
}
