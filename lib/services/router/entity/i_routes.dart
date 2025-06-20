import 'package:billiards/services/router/entity/route_service.dart';
import 'package:get/get.dart';
import 'package:riverpod/riverpod.dart';

final routesProvider = Provider<IRoutes>((ref) {
  return ref.watch(implRouterServiceProvider);
});

abstract interface class IRoutes {
  List<GetPage> get pages;
  String get initialPage;
  GetPage get unknownPage;
}
