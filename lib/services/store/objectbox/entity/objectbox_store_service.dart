import 'package:billiards/objectbox.g.dart';
import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';

class ObjectboxStoreService implements IObjectboxStoreService {
  @override
  final Store? store;

  ObjectboxStoreService({this.store});

  @override
  IObjectboxStoreService copyWith({Store? store}) {
    return ObjectboxStoreService(store: store ?? this.store);
  }
}
