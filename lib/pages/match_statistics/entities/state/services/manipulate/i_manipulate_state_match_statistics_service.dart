import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/match_statistics/entities/state/services/manipulate/manipulate_state_match_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateMatchStatisticsServiceProvider =
    Provider.autoDispose<IManipulateStateMatchStatisticsService>(
        (ref) => ManipulateStateMatchStatisticsService(ref));

abstract interface class IManipulateStateMatchStatisticsService {
  void initializeState(IMatch match);
}
