import 'package:billiards/entities/game_state/services/match/i_match_game_state_service.dart';
import 'package:billiards/entities/game_state/services/view/i_view_game_state_service.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/services/manipulate_repository/i_manipulate_users_service.dart';
import 'package:billiards/managers/manipulate_users/i_manipulate_users_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateUsersManager implements IManipulateUsersManager {
  final Ref ref;

  ManipulateUsersManager(this.ref);

  IViewGameStateService get viewGameState =>
      ref.read(viewGameStateServiceProvider);
  IMatchGameStateService get matchGameState =>
      ref.read(matchGameStateServiceProvider);
  IManipulateUsersService get manipulateUsers =>
      ref.read(manipulateUsersServiceProvider);

  @override
  Future<void> deleteUser(IUser user) async {
    final currentMatch = await viewGameState.getCurrentMatch();
    if (currentMatch?.users.contains(user) ?? false) {
      await matchGameState.endMatch();
    }
    await manipulateUsers.deleteUser(user);
  }

  @override
  Future<IUser> createUser(String name) async {
    return manipulateUsers.createUser(name);
  }
}
