import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_select_turn/services/communicate_to_managers/communicate_to_managers_round_select_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersRoundSelectTurnServiceProvider =
    Provider.autoDispose<ICommunicateToManagersRoundSelectTurnService>(
        (ref) => CommunicateToManagersRoundSelectTurnService(ref));

abstract interface class ICommunicateToManagersRoundSelectTurnService {
  Future<List<IPlayer>> loadPlayers();
  Future<void> selectPlayer(IPlayer player);
}
