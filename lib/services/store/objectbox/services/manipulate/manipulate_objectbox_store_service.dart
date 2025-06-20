import 'package:billiards/services/store/objectbox/entity/i_objectbox_store_service.dart';
import 'package:billiards/services/store/objectbox/services/manipulate/i_manipulate_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';

class ManipulateObjectboxStoreService
    implements IManipulateObjectboxStoreService {
  final StateController<IObjectboxStoreService> objectboxStoreService;

  ManipulateObjectboxStoreService(this.objectboxStoreService);

  IObjectboxStoreService get objectboxStore => objectboxStoreService.state;
  void update(IObjectboxStoreService storeService) =>
      objectboxStoreService.state = storeService;

  @override
  void loadStore(Store store) {
    update(objectboxStore.copyWith(store: store));
  }
}
