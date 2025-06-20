import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_round/entities/state/services/manipulate/manipulate_state_left_round_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateLeftRoundServiceProvider =
    Provider.autoDispose<IManipulateStateLeftRoundService>(
        (ref) => ManipulateStateLeftRoundService(ref));

abstract interface class IManipulateStateLeftRoundService {
  void initializeState(IRound round, int roundIndex);
}
