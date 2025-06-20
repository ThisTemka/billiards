import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/services/communicate_to_managers/communicate_to_managers_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersRoundTurnServiceProvider =
    Provider.autoDispose<ICommunicateToManagersRoundTurnService>(
        (ref) => CommunicateToManagersRoundTurnService(ref));

abstract interface class ICommunicateToManagersRoundTurnService {
  Future<void> completeTurn(RoundTurnState state);
  Future<void> closeRound();
  Future<IRound> getCurrentRound();
  Future<IPlayer> getCurrentPlayer();
}
