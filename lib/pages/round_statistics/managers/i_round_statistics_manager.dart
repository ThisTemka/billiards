import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/round_statistics/managers/round_statistics_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundStatisticsManagerProvider =
    Provider.autoDispose<IRoundStatisticsManager>(
        (ref) => RoundStatisticsManager(ref));

abstract interface class IRoundStatisticsManager {
  void loadState(IRound round);
  void nextRound();
  Future<void> closeMatch();
}
