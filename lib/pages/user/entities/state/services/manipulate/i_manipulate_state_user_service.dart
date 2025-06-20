import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/user/entities/state/services/manipulate/manipulate_state_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateUserServiceProvider =
    Provider.autoDispose<IManipulateStateUserService>((ref) {
  return ManipulateStateUserService(ref);
});

abstract interface class IManipulateStateUserService {
  void initializeState(IUser user, int userIndex);
}
