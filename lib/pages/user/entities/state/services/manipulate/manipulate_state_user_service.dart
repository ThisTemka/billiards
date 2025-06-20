import 'package:billiards/pages/user/entities/state/services/manipulate/i_manipulate_state_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import '../../user_state.dart';

class ManipulateStateUserService implements IManipulateStateUserService {
  final Ref ref;

  ManipulateStateUserService(this.ref);

  void setState(UserState state) =>
      ref.read(userStateProvider.notifier).state = state;
  UserState get state => ref.read(userStateProvider);

  @override
  void initializeState(IUser user, int userIndex) {
    setState(state.copyWith(
      user: user,
      userIndex: userIndex,
      isLoading: false,
    ));
  }
}
