import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:billiards/services/store/objectbox/services/use/i_use_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final useStoreServiceProvider = Provider.autoDispose<IUseStoreService>((ref) {
  return ref.watch(useObjectboxStoreServiceProvider);
});

abstract interface class IUseStoreService {
  IRepository<T> getRepository<T extends IEntity>();
}
