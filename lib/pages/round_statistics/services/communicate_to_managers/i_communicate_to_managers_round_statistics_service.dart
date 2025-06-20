import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/round_statistics/services/communicate_to_managers/communicate_to_managers_round_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersRoundStatisticsServiceProvider =
    Provider.autoDispose<ICommunicateToManagersRoundStatisticsService>(
        (ref) => CommunicateToManagersRoundStatisticsService(ref));

abstract interface class ICommunicateToManagersRoundStatisticsService {
  Future<void> nextRound();
  Future<void> closeMatch();
  Future<IMatch> getCurrentMatch();
}
