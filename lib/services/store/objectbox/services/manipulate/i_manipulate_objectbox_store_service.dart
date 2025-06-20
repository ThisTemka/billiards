import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';
import 'package:billiards/services/store/objectbox/services/manipulate/manipulate_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';

final manipulateObjectboxStoreServiceProvider =
    Provider.autoDispose<IManipulateObjectboxStoreService>((ref) {
  final objectboxStoreService =
      ref.read(objectboxStoreServiceProvider.notifier);
  return ManipulateObjectboxStoreService(objectboxStoreService);
});

abstract interface class IManipulateObjectboxStoreService {
  void loadStore(Store store);
}
