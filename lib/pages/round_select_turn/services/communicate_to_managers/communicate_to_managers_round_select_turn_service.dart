import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/view_game/i_view_game_manager.dart';
import 'package:billiards/pages/round_select_turn/services/communicate_to_managers/i_communicate_to_managers_round_select_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicateToManagersRoundSelectTurnService
    implements ICommunicateToManagersRoundSelectTurnService {
  final Ref ref;

  CommunicateToManagersRoundSelectTurnService(this.ref);

  IViewGameManager get viewGameManager => ref.watch(viewGameManagerProvider);
  IManipulateGameManager get manipulateGameManager =>
      ref.read(manipulateGameManagerProvider);

  @override
  Future<List<IPlayer>> loadPlayers() async {
    final round = await viewGameManager.getCurrentRound();
    return round!.players;
  }

  @override
  Future<void> selectPlayer(IPlayer player) async {
    await manipulateGameManager.selectPlayer(player);
  }
}
