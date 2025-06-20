import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_match/entities/state/services/manipulate/manipulate_state_left_match_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateLeftMatchServiceProvider =
    Provider.autoDispose<IManipulateStateLeftMatchService>(
        (ref) => ManipulateStateLeftMatchService(ref));

abstract interface class IManipulateStateLeftMatchService {
  void initializeState(IMatch match);
}
