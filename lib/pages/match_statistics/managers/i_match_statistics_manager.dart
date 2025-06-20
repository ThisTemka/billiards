import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/match_statistics/managers/match_statistics_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchStatisticsManagerProvider =
    Provider.autoDispose<IMatchStatisticsManager>(
        (ref) => MatchStatisticsManager(ref));

abstract interface class IMatchStatisticsManager {
  void loadState(IMatch match);
  void startNewMatch();
  void exit();
}
