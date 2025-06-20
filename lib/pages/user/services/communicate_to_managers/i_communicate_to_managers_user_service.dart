import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/user/services/communicate_to_managers/communicate_to_managers_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersUserServiceProvider =
    Provider.autoDispose<ICommunicateToManagersUserService>(
        (ref) => CommunicateToManagersUserService(ref));

abstract interface class ICommunicateToManagersUserService {
  Future<int> getTop(IUser user);
}
