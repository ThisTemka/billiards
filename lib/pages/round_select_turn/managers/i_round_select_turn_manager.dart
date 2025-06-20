import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/pages/round_select_turn/managers/round_select_turn_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundSelectTurnManagerProvider =
    Provider.autoDispose<IRoundSelectTurnManager>(
        (ref) => RoundSelectTurnManager(ref));

abstract interface class IRoundSelectTurnManager {
  void loadState();
  void selectPlayer(IPlayer player);
}
