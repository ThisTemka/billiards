import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/match_select_users/entities/match_select_player_state.dart';
import 'package:billiards/pages/match_select_users/entities/services/manipulate/i_manipulate_state_match_select_player_service.dart';
import 'package:billiards/pages/match_select_users/managers/i_match_select_users_manager.dart';
import 'package:billiards/pages/match_select_users/services/communicate_to_managers/i_communicate_to_managers_match_select_users_service.dart';
import 'package:billiards/pages/match_select_users/services/route/i_route_match_select_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchSelectUsersManager implements IMatchSelectUsersManager {
  final Ref ref;

  MatchSelectUsersManager(this.ref);

  ICommunicateToManagersMatchSelectUsersService get communicateToManagers =>
      ref.watch(communicateToManagersMatchSelectUsersServiceProvider);
  IRouteMatchSelectUsersService get route =>
      ref.read(routeMatchSelectUsersServiceProvider);
  IManipulateStateMatchSelectPlayerService get manipulateState =>
      ref.read(manipulateStateMatchSelectPlayerServiceProvider);

  @override
  Future<void> startNewMatch() async {
    final state = ref.read(matchSelectPlayerStateProvider);
    if (state.isPlayersSelected) {
      await communicateToManagers
          .startNewMatch(state.selectedUsers.cast<IUser>());
      route.navigateToRoundSelectTurn();
    }
  }

  @override
  Future<void> createUser(String name, int userInputIndex) async {
    final user = await communicateToManagers.createUser(name);
    manipulateState.selectUser(user, userInputIndex);
  }

  @override
  Future<void> loadState() async {
    final users = await communicateToManagers.getUsers();
    manipulateState.initializeState(users);
  }

  @override
  void changeQuery(String query, int userInputIndex) {
    final user = manipulateState.getUser(query);
    if (user != null) {
      selectUser(user, userInputIndex);
    } else {
      manipulateState.filterUsers(query);
    }
  }

  @override
  void selectUser(IUser user, int userInputIndex) {
    manipulateState.selectUser(user, userInputIndex);
    manipulateState.clearFilteredUsers();
  }

  @override
  void focusUserInput(bool focused, int userInputIndex) {
    manipulateState.focusUserInput(focused, userInputIndex);
  }
}
