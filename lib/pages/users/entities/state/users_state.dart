import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersStateProvider = StateProvider.autoDispose<UsersState>((ref) {
  return UsersState();
});

class UsersState {
  final bool isLoading;
  final List<IUser> users;

  const UsersState({
    this.isLoading = true,
    this.users = const [],
  });

  UsersState copyWith({
    bool? isLoading,
    List<IUser>? users,
  }) {
    return UsersState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
