import 'package:billiards/pages/users/services/route/i_route_users_service.dart';
import 'package:billiards/services/router/entity/route_type.dart';
import 'package:billiards/services/router/services/navigate/i_navigate_route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';

class RouteUsersService implements IRouteUsersService {
  final Ref ref;
  RouteUsersService(this.ref);

  INavigateRouteService get navigateRoute =>
      ref.read(navigateRouteServiceProvider);

  @override
  void navigateToUser(IUser user) {
    navigateRoute.navigateToWithArguments(RouteType.user, [user]);
  }
}
