import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/match_select_users/entities/match_select_player_state.dart';
import 'package:billiards/pages/match_select_users/entities/services/manipulate/i_manipulate_state_match_select_player_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateStateMatchSelectPlayerService
    implements IManipulateStateMatchSelectPlayerService {
  final Ref ref;

  ManipulateStateMatchSelectPlayerService(this.ref);

  void setState(MatchSelectPlayerState state) =>
      ref.read(matchSelectPlayerStateProvider.notifier).state = state;
  MatchSelectPlayerState get state => ref.read(matchSelectPlayerStateProvider);

  @override
  Future<void> initializeState(List<IUser> users) async {
    setState(
        state.copyWith(users: users, filteredUsers: users, isLoading: false));
  }

  @override
  void focusUserInput(bool focused, int userIndex) {
    setState(state.copyWith(
      focusedUserIndex: focused ? userIndex : -1,
    ));
  }

  @override
  void selectUser(IUser user, int userIndex) {
    setState(state.copyWith(
      selectedUsers: state.selectedUsers..[userIndex] = user,
    ));
  }

  @override
  void filterUsers(String query) {
    setState(state.copyWith(
      filteredUsers: state.users
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) &&
              !state.selectedUsers.contains(user))
          .toList(),
    ));
  }

  @override
  IUser? getUser(String query) {
    return state.users
        .where((user) =>
            user.name.toLowerCase() == query.toLowerCase() &&
            !state.selectedUsers.contains(user))
        .firstOrNull;
  }

  @override
  void clearFilteredUsers() {
    setState(state.copyWith(
      filteredUsers: const [],
    ));
  }
}
