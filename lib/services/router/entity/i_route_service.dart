import 'package:billiards/services/router/entity/route_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeServiceControllerProvider =
    Provider.autoDispose<StateController<IRouteService>>((ref) {
  return ref.read(implRouterServiceProvider.notifier);
});

final routeServiceProvider = Provider.autoDispose<IRouteService>((ref) {
  return ref.watch(implRouterServiceProvider);
});

abstract interface class IRouteService {}
