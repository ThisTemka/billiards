import 'package:billiards/pages/users/entities/state/services/manipulate/manipulate_state_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';

final manipulateStateUsersServiceProvider =
    Provider.autoDispose<IManipulateStateUsersService>((ref) {
  return ManipulateStateUsersService(ref);
});

abstract interface class IManipulateStateUsersService {
  void initializeState(List<IUser> users);
  void deleteUser(IUser user);
}
