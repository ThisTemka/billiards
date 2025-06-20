import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_select_turn/entities/state/services/manipulate/manipulate_state_round_select_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateRoundSelectTurnServiceProvider =
    Provider.autoDispose<IManipulateStateRoundSelectTurnService>(
        (ref) => ManipulateStateRoundSelectTurnService(ref));

abstract interface class IManipulateStateRoundSelectTurnService {
  void initializeState(List<IPlayer> players);
}
