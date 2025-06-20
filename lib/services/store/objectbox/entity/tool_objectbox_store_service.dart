import 'package:billiards/objectbox.g.dart';
import 'package:billiards/services/store/objectbox/services/manipulate/i_manipulate_objectbox_store_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> toolObjectboxStoreService(Ref ref) async {
  final objectboxStoreService =
      ref.read(manipulateObjectboxStoreServiceProvider);
  final store = await openStore();
  objectboxStoreService.loadStore(store);
}
