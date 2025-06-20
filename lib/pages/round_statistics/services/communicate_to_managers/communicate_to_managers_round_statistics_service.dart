import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/view_game/i_view_game_manager.dart';
import 'package:billiards/pages/round_statistics/services/communicate_to_managers/i_communicate_to_managers_round_statistics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersRoundStatisticsService
    implements ICommunicateToManagersRoundStatisticsService {
  final Ref _ref;

  CommunicateToManagersRoundStatisticsService(this._ref);

  IViewGameManager get viewGame => _ref.watch(viewGameManagerProvider);
  IManipulateGameManager get manipulateGame =>
      _ref.read(manipulateGameManagerProvider);

  @override
  Future<void> nextRound() async {
    await manipulateGame.nextRound();
  }

  @override
  Future<void> closeMatch() async {
    await manipulateGame.closeMatch();
  }

  @override
  Future<IMatch> getCurrentMatch() async {
    final match = await viewGame.getCurrentMatch();
    return match!;
  }
}
