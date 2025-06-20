import 'package:billiards/pages/home/entities/state/services/manipulate/manipulate_home_state_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateHomeServiceProvider =
    Provider.autoDispose<IManipulateStateHomeService>((ref) {
  return ManipulateStateHomeService(ref);
});

abstract interface class IManipulateStateHomeService {
  void initializeState(bool hasUnfinishedMatch);
}
