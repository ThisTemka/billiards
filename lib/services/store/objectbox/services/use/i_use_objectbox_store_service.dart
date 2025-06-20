import 'package:billiards/services/store/main/services/use/i_use_store_service.dart';
import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';
import 'package:billiards/services/store/objectbox/services/use/use_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final useObjectboxStoreServiceProvider =
    Provider.autoDispose<IUseObjectboxStoreService>((ref) {
  final storeService = ref.watch(objectboxStoreServiceProvider);
  return UseObjectboxStoreService(storeService);
});

abstract interface class IUseObjectboxStoreService
    implements IUseStoreService {}
