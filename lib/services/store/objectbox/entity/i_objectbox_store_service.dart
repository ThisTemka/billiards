import 'package:billiards/services/store/main/entity/i_store_service.dart';
import 'package:billiards/services/store/objectbox/entity/objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';

final objectboxStoreServiceProvider =
    StateProvider<IObjectboxStoreService>((ref) {
  return ObjectboxStoreService();
});

abstract interface class IObjectboxStoreService implements IStoreService {
  Store? get store;

  IObjectboxStoreService copyWith({
    Store? store,
  });
}
