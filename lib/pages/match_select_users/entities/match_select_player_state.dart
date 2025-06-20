import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchSelectPlayerStateProvider =
    StateProvider.autoDispose<MatchSelectPlayerState>(
  (ref) => MatchSelectPlayerState(),
);

class MatchSelectPlayerState {
  final bool isLoading;
  final List<IUser> users;

  final List<IUser> filteredUsers;
  final int focusedUserIndex;

  final List<IUser?> selectedUsers;

  IUser? get firstUser => selectedUsers[0];
  IUser? get secondUser => selectedUsers[1];
  bool get isFirstUserSelected => firstUser != null;
  bool get isSecondUserSelected => secondUser != null;
  bool get isPlayersSelected => isFirstUserSelected && isSecondUserSelected;

  MatchSelectPlayerState({
    this.isLoading = true,
    this.users = const [],
    this.filteredUsers = const [],
    this.focusedUserIndex = 0,
    this.selectedUsers = const [null, null],
  });

  MatchSelectPlayerState copyWith({
    bool? isLoading,
    int? focusedUserIndex,
    List<IUser>? users,
    List<IUser>? filteredUsers,
    List<IUser?>? selectedUsers,
  }) {
    return MatchSelectPlayerState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      focusedUserIndex: focusedUserIndex ?? this.focusedUserIndex,
    );
  }
}
