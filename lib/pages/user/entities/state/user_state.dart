import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

final userStateProvider = StateProvider<UserState>((ref) {
  return UserState();
});

class UserState {
  final bool isLoading;
  final IUser? user;
  final int? top;

  const UserState({
    this.isLoading = true,
    this.user,
    this.top,
  });

  UserState copyWith({
    bool? isLoading,
    IUser? user,
    int? userIndex,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      top: userIndex ?? this.top,
    );
  }
}
