import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:billiards/services/store/main/entity/i_store_service.dart';
import 'package:billiards/services/store/main/services/use/i_use_store_service.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/providered_use_store_service_.dart';
import 'package:riverpod/riverpod.dart';

final provideredUseStoreServiceProvider =
    Provider<IProvideredUseStoreServiceWrapper>((ref) {
  final store = ref.watch(useStoreServiceProvider);
  return ProvideredUseStoreServiceWrapper(store);
});

abstract interface class IProvideredUseStoreServiceWrapper
    implements IStoreService {
  IRepository<T> getProvideredRepository<T extends IEntity>(Ref ref);
}
