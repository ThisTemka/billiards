import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:billiards/services/store/main/services/use/i_use_store_service.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/providered_repository_wrapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvideredUseStoreServiceWrapper
    implements IProvideredUseStoreServiceWrapper, IUseStoreService {
  final IUseStoreService useStoreService;

  ProvideredUseStoreServiceWrapper(this.useStoreService);

  @override
  IRepository<T> getProvideredRepository<T extends IEntity>(Ref ref) {
    final repository = useStoreService.getRepository<T>();
    final provideredRepository =
        ProvideredRepositoryWrapper<T>(ref, repository);
    return provideredRepository;
  }

  @override
  IRepository<T> getRepository<T extends IEntity>() {
    return useStoreService.getRepository<T>();
  }
}
