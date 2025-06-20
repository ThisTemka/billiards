import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_statistics/entities/state/services/manipulate/manipulate_state_round_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateRoundStatisticsServiceProvider =
    Provider.autoDispose<IManipulateStateRoundStatisticsService>(
        (ref) => ManipulateStateRoundStatisticsService(ref));

abstract interface class IManipulateStateRoundStatisticsService {
  void initializeState(IRound round);
}
