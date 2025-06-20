import 'package:billiards/pages/users/entities/state/services/manipulate/i_manipulate_state_users_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/users/entities/state/users_state.dart';

class ManipulateStateUsersService implements IManipulateStateUsersService {
  final Ref _ref;

  ManipulateStateUsersService(this._ref);

  void setState(UsersState state) =>
      _ref.read(usersStateProvider.notifier).state = state;
  UsersState get state => _ref.read(usersStateProvider);

  @override
  void initializeState(List<IUser> users) {
    setState(state.copyWith(users: users, isLoading: false));
  }

  @override
  void deleteUser(IUser user) async {
    setState(state.copyWith(
        users: state.users.where((element) => element.id != user.id).toList()));
  }
}
