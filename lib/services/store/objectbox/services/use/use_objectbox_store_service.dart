import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';
import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:billiards/services/store/objectbox/services/use/objectbox_repository.dart';
import 'package:billiards/services/store/objectbox/services/use/i_use_objectbox_store_service.dart';

class UseObjectboxStoreService implements IUseObjectboxStoreService {
  final IObjectboxStoreService _objectboxStoreService;

  UseObjectboxStoreService(this._objectboxStoreService);

  @override
  IRepository<T> getRepository<T extends IEntity>() {
    final box = _objectboxStoreService.store!.box<T>();
    return ObjectboxRepository<T>(box);
  }
}
