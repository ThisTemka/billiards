import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/pages/users/services/route/route_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeUsersServiceProvider =
    Provider.autoDispose<IRouteUsersService>((ref) => RouteUsersService(ref));

abstract interface class IRouteUsersService {
  void navigateToUser(IUser user);
}
