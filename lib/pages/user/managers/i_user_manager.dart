import 'package:billiards/pages/user/managers/user_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';

final userManagerProvider =
    Provider.autoDispose<IUserManager>((ref) => UserManager(ref));

abstract interface class IUserManager {
  void loadState(IUser user);
}
