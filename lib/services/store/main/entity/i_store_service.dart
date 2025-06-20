import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';
import 'package:riverpod/riverpod.dart';

final storeServiceProvider = Provider.autoDispose<IStoreService>((ref) {
  return ref.watch(objectboxStoreServiceProvider);
});

final storeServiceControllerProvider =
    Provider.autoDispose<StateController<IStoreService>>((ref) {
  return ref.read(objectboxStoreServiceProvider.notifier);
});

abstract interface class IStoreService {}
